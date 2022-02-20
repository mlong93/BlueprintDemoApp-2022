//
//  MovieParser.swift
//  BlueprintDemoApp-2022
//
//  Created by Mindy Long on 2/19/22.
//

import Foundation
import SwiftyJSON

// Protocols group methods, properties, and other requirements for a specific task
// They're subscribed to by classes, structs, or enums for actual implementation.
//
// Everything that subscribes to a protocol MUST use the variables/methods
// defined in the protocol.
//
// Why do we need delegates? Think: how does the table view know when the data
// has finished loading?
//
// Delegates send a "signal" out to subscribers so the subscribers know when
// they should do a task e.g. reload a page, adjust values, etc.
// Think of subscribers to delegates as LISTENERS.
protocol LoadDelegate {
    func didFinishLoadData(finished: Bool)
    func resendRequest()
}

struct Movie {
    let title, image, synopsis, releaseDate, rating: String
    let categories: [Int]
}

class Movies {
    
    // Where we send our GET request
    // aka asking for information from the API server
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    
    // Often times when you make an API request to a public server, they will have
    // you make an account to give you an API key to actually access their APIs
    private let apiKey = "?api_key=" + "cd4b0ccf04fbd7e32df6da4d1c03bd36"
    
    // the second half of the API URL
    private let baseURL2 = "&language=en-US&page=1"
    
    // For image info
    private let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
    
    // API codes
    private let options = [
        "latest": "latest",
        "now_playing": "now_playing",
        "popular":"popular",
        "top rated": "top_rated",
        "upcoming": "upcoming"
    ]
    
    private var movieData: [Movie] = []
    
    var loadDelegate: LoadDelegate?
    
    // This function will send a GET request to the API to "fetch" (ask) for data.
    // Check out the AlamoFire package for easier ways to make an API request!
    func fetchMovies(description: String) {
        let url = Foundation.URL(string: baseURL + description + apiKey + baseURL2)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            // What if an error occurs?
            // Client errors occur when the client(you!)'s request doesn't follow correct syntax
            // HTTP status code 4xx
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            // On the other hand, server errors mean something went wrong within the API's server
            // HTTP status code 5xx
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Server error!")
                
                // Tell all listeners to our delegate to handle the error
                // by having them try to resend a request to the endpoint
                self.loadDelegate?.resendRequest()
                return
            }
            
            // Runs when there are no errors
            guard let jsonData = data else {
                return
            }
            self.parseData(data: jsonData)
        }
        
        // Tasks are automatically suspended -
        // task.resume() makes sure next time you call fetchMovies() the task will have resumed
        task.resume()
        
    }
    
    func parseData(data: Data) {
        // Try parsing the data
        do {
            // Convert it to JSON
            let json = try JSON(data: data)
            let results = json["results"]
            
            // Check SwifyJSON docs for more documentation
            // Moral of the story: READ DOCUMENTATION
            for (_, movie) : (String, JSON) in results {
                
                // Get the data we need
                let title = movie["original_title"].stringValue
                let image = imageBaseURL + movie["poster_path"].stringValue
                let overview = movie["overview"].stringValue
                let releaseDate = movie["release_date"].stringValue
                let rating = movie["vote_average"].stringValue
                let genres = movie["genre_ids"].arrayValue.map { $0.intValue }
                
                // Make a new Movie struct object
                let m = Movie(title: title, image: image, synopsis: overview, releaseDate: releaseDate, rating: rating, categories: genres)
                movieData.append(m)
            }
            
            // Tell all listeners that we're done parsing and that they can refresh!
            DispatchQueue.main.async{
                self.loadDelegate!.didFinishLoadData(finished: true)
            }
            
        } catch let SwiftyJSONError {
            print("decoding error")
            print(SwiftyJSONError)
        }
    }
    
    // getter: to access private vars outside the class
    func getMovies() -> [Movie] {
        return self.movieData
    }
}

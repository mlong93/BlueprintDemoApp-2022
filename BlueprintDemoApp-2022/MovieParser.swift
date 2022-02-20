//
//  MovieParser.swift
//  BlueprintDemoApp-2022
//
//  Created by Mindy Long on 2/19/22.
//

import Foundation
import SwiftyJSON

struct Movie {
    let title, rating, synopsis, releaseDate, imageURL: String
    let categories: [Int]
}

class Movies {
    private var movieData: [Movie] = []
    private let imageBaseURL = "https://image.tmdb.org/t/p/w500/"
    
    func getData() {
        // fetch data from url
        guard let path = Bundle.main.path(forResource: "Movies", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            parseData(data: data)
        } catch {
            print(error)
        }
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
                let m = Movie(title: title, rating: rating, synopsis: overview, releaseDate: releaseDate, imageURL: image, categories: genres)
                movieData.append(m)
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

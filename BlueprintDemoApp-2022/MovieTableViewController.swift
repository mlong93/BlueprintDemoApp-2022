//
//  MovieTableViewController.swift
//  BlueprintDemoApp-2022
//
//  Created by Mindy Long on 2/19/22.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    let movieParser = Movies()
    var movieData: [Movie] = []
    var category = "popular" // indicates which category to pull movies from
    
    // viewWillAppear() is called before viewDidLoad().
    // We fetch our data before our view loads so that it's shown when we get to the page.
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        reloadPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // ** IMPORTANT: Don't forget to register your cells! ** //
        self.tableView.register(MovieViewCell.self, forCellReuseIdentifier: MovieViewCell.movieCellId)
        
        // ** IMPORTANT: Don't forget to subscribe to a delegate! ** //
        movieParser.loadDelegate = self
        
        fetchData()
        reloadPage()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movieData.count
    }
    
    // Creates a cell for each row, returns a MovieViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creates or returns an existing reusable MovieViewCell based on movie cell's unique identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieViewCell.movieCellId, for: indexPath) as! MovieViewCell // indexPath = {"row": , "section":}
        cell.setupViews()
        
        // ///////////////////////////////////////////////// //
        // How to pass data from TableView to TableViewCell! //
        // ///////////////////////////////////////////////// //
        let index = indexPath.row
        let movie = self.movieData[index]
        cell.title.text = movie.title
        cell.synopsis.text = movie.synopsis
        cell.rating.text = movie.rating + "/10"
        cell.releaseDate.text = movie.releaseDate
        
        // ////////////////////////////////////////////////////////////////////////////////
        // DispatchQueue manages how tasks are executed                                  //
        // - global() are tasks happening in the background (doesn't matter if onscreen) //
        // - async is usually used for tasks that take a long time (e.g. data fetching)  //
        // so as to not block other tasks from executing timely                          //
        // ///////////////////////////////////////////////////////////////////////////// //
        let imageURL = URL(string: movie.image)!
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                let posterImage = UIImage(data: data)
                cell.poster.contentMode = .scaleAspectFit
                cell.poster.image = posterImage
            }
        }

        return cell
    }
    
    // This function handles a tap at a row in the table.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Setup a new ViewController for a movie
        let mv = MovieView()
        
        // Pass data corresponding to this table cell
        let index = indexPath.row
        let movie = self.movieData[index]
        mv.posterImageURL = movie.image
        mv.contents.append(movie.title)
        mv.contents.append(movie.synopsis)
        mv.contents.append(movie.releaseDate)
        mv.contents.append(movie.categories)
        mv.contents.append(movie.rating)
        
        // Add controller to navigation stack
        navigationController?.pushViewController(mv, animated: true)
    }
    
    // Let's adjust the height of each cell. In collection views, you have more creative freedom and can change the size (shape) of each cell.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: data loading functions
extension MovieTableViewController {
    // more functions here
    
    func fetchData() {
        // calls the fetchMovies() method from MovieParser.swift which gathers information from the API's server
        DispatchQueue.global().async {
            self.movieParser.fetchMovies(description: self.category)
        }
        
    }
    
    func reloadPage() {
        self.movieData = self.movieParser.getMovies()
        self.tableView.reloadData()
    }
}

// MARK: listen to when data loading is complete
extension MovieTableViewController: LoadDelegate {
    
    // How do we know if the data has been loaded?
    func didFinishLoadData(finished: Bool) {
        
        guard finished else {
            // When data is still being fetched from API and loaded
            return
        }
        
        // Once all data is fetched and loaded, update the UI to reflect changes
        reloadPage()
    }
    
    func resendRequest() {
        fetchData()
    }
    
    
}

import SwiftUI
// This struct from SwiftUI shows us the content preview in the canvas page.
struct MovieTablePreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        

            func makeUIViewController(context: UIViewControllerRepresentableContext<MovieTablePreview.ContainerView>) -> UIViewController {
                return UINavigationController(rootViewController: MovieTableViewController())
            }

            func updateUIViewController(_ uiViewController: MovieTablePreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MovieTablePreview.ContainerView>) {

            }

        }
}

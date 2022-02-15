//
//  ViewController.swift
//  Flix
//
//  Created by Winston Peng on 2/7/22.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String: Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 
                // TODO: Get the array of movies
                 // TODO: Store the movies in a property to use elsewhere

                 self.movies = dataDictionary["results"] as! [[String: Any]]
//                 print("movie list coming up")
//                 print(self.movies.count)
//                 print(self.movies[0])
                 self.tableView.rowHeight = 150
//                 print(self.movies[0]["title"].unsafelyUnwrapped)
//                 print(self.movies)
//                 print(self.movies["release_date"])
//                 print(type(self.movies["title"]))
//                 print(self.movies["title"])
                    // TODO: Reload your table view data
                 self.tableView.reloadData()
             }
        }
        
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = self.movies[indexPath.row]
        cell.movieTitle.text = movie["title"] as? String
        cell.movieDescription.text = movie["overview"] as? String

        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let imageUrl = URL(string: baseUrl + (movie["poster_path"] as! String))
        cell.movieImage.af.setImage(withURL: imageUrl!)
//        let cell = UITableViewCell()
//        cell.textLabel!.text = "row: \(indexPath.row)"
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("showing movie details")
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        let detailsViewController = segue.destination as! MovieDetailViewController
        detailsViewController.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


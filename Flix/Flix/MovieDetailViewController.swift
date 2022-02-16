//
//  MovieDetailViewController.swift
//  Flix
//
//  Created by Winston Peng on 2/14/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: [String: Any]!
    
    @IBOutlet weak var moviePfp: UIImageView!
    @IBOutlet weak var movieBackgroundPic: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        print(movie!)
        self.titleLabel.text = movie["title"] as? String
        self.descLabel.text = movie["overview"] as? String
        self.dateLabel.text = movie["release_date"] as? String
        let baseUrl = "https://image.tmdb.org/t/p/w"
        let pfpUrl = URL(string: baseUrl + "185" +  (movie["poster_path"] as! String))
        let bgUrl = URL(string: baseUrl + "780" +  (movie["backdrop_path"] as! String))
        self.movieBackgroundPic.af.setImage(withURL: bgUrl!)
        self.moviePfp.af.setImage(withURL: pfpUrl!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

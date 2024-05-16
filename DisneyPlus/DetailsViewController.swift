//
//  FilmsViewController.swift
//  DisneyPlus
//
//  Created by Kaan Uzun on 15.05.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var ivFilm: UIImageView!
    @IBOutlet weak var lblFilmName: UILabel!
    
    var film: Films?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film{
            lblFilmName.text = f.name
            ivFilm.image = UIImage(named: f.image!)
        }
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        if let f = film{
            print("Playing - \(f.name!)")
        }
    }
}

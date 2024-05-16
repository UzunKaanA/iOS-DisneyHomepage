//
//  ViewController.swift
//  DisneyPlus
//
//  Created by Kaan Uzun on 15.05.2024.
//

import UIKit

class HomepageViewController: UIViewController {
    
    @IBOutlet weak var whatToWatchTonightCollectionView: UICollectionView!
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var newToDisneyCollectionView: UICollectionView!
    
    var featuredList = [Films]()
    var newToDisneyList = [Films]()
    var whatToWatchTonightList = [Films]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Disney+"

            if let customFont = UIFont(name: "Pacifico-Regular", size: 25) {
                let navBarTitleAttributes: [NSAttributedString.Key: Any] = [
                    .font: customFont,
                    .foregroundColor: UIColor.white // Set the text color to white
                ]
                self.navigationController?.navigationBar.titleTextAttributes = navBarTitleAttributes
            }
        
        
        let f1 = Films(id: 1, name: "Logan", image: "logan")
        let f2 = Films(id: 2, name: "Deadpool", image: "deadpool")
        let f3 = Films(id: 3, name: "Deadpool 2", image: "deadpool2")
        let f4 = Films(id: 4, name: "Modern Family", image: "modern-family")
        let f5 = Films(id: 5, name: "X-Men 97", image: "theMarvels")
        featuredList.append(f1)
        featuredList.append(f2)
        featuredList.append(f3)
        featuredList.append(f4)
        featuredList.append(f5)
        
        let n1 = Films(id: 1, name: "X-Men 97", image: "xmen")
        let n2 = Films(id: 2, name: "Simpsons May The 12th be With You", image: "simpsons")
        let n3 = Films(id: 3, name: "The Beatles Let It Be", image: "letitbe")
        let n4 = Films(id: 4, name: "Doctor Who?", image: "doctorWho")
        let n5 = Films(id: 5, name: "Star Wars", image: "sw")
        newToDisneyList.append(n1)
        newToDisneyList.append(n2)
        newToDisneyList.append(n3)
        newToDisneyList.append(n4)
        newToDisneyList.append(n5)
        
        let w1 = Films(id: 1, name: "Deadpool", image: "deadpool")
        let w2 = Films(id: 2, name: "The Marvels", image: "theMarvels")
        let w3 = Films(id: 3, name: "Modern Family", image: "modern-family")
        let w4 = Films(id: 4, name: "Deadpool 2", image: "deadpool2")
        let w5 = Films(id: 5, name: "Civil War", image: "civilWar")
        whatToWatchTonightList.append(w1)
        whatToWatchTonightList.append(w2)
        whatToWatchTonightList.append(w3)
        whatToWatchTonightList.append(w4)
        whatToWatchTonightList.append(w5)
        
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        newToDisneyCollectionView.dataSource = self
        newToDisneyCollectionView.delegate = self
        whatToWatchTonightCollectionView.dataSource = self
        whatToWatchTonightCollectionView.delegate = self
        
        // Configure collection view layouts
        configureCollectionViewLayout(for: featuredCollectionView)
        configureNewToDisneyCollectionViewLayout(for: newToDisneyCollectionView)
        configureNewToDisneyCollectionViewLayout(for: whatToWatchTonightCollectionView)
        
        // Function to configure the layout of a collection view
        func configureCollectionViewLayout(for collectionView: UICollectionView) {
            let design = UICollectionViewFlowLayout()
            design.scrollDirection = .horizontal
            design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            design.minimumInteritemSpacing = 10
            design.minimumLineSpacing = 0
            //10 X 10
            let screenWidth = UIScreen.main.bounds.width
            let itemWidth = (screenWidth - 20) / 1
            
            design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.7)
            
            collectionView.collectionViewLayout = design
        }
        
        // Function to configure the layout of a collection view
        func configureNewToDisneyCollectionViewLayout(for collectionView: UICollectionView) {
            let design = UICollectionViewFlowLayout()
            design.scrollDirection = .horizontal
            design.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            design.minimumInteritemSpacing = 5
            design.minimumLineSpacing = 5 // Adjust as needed
            
            // 5 X 5 X 5 X 5
            let screenWidth = UIScreen.main.bounds.width
            let itemWidth = (screenWidth - 20) / 3
            
            design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.1)
            
            collectionView.collectionViewLayout = design
        }
        
        
        
        
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension HomepageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredCollectionView {
            return featuredList.count
        } else if collectionView == newToDisneyCollectionView {
            return newToDisneyList.count
        }
        else if collectionView == whatToWatchTonightCollectionView {
            return whatToWatchTonightList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featuredCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featuredCell", for: indexPath) as! FeaturedCollectionViewCell
            let featured = featuredList[indexPath.row]
            cell.ivFeatured.image = UIImage(named: featured.image!)
            return cell
        } else if collectionView == newToDisneyCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newToDisneyCell", for: indexPath) as! NewToDisneyCollectionViewCell
            let newToDisney = newToDisneyList[indexPath.row]
            cell.ivNewTo.image = UIImage(named: newToDisney.image!)
            return cell
        } else if collectionView == whatToWatchTonightCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "whatToWatchCell", for: indexPath) as! WhatToWatchTonightCollectionViewCell // Replace "whatToWatchTonightCell" with your actual cell identifier
            let whatToWatchTonight = whatToWatchTonightList[indexPath.row]
            cell.ivWhatToWatch.image = UIImage(named: whatToWatchTonight.image!) // Replace ivWhatToWatchTonight with your actual image view
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = featuredList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
            if let film = sender as? Films {
                let vc = segue.destination as! DetailsViewController
                vc.film = film
            }
        }
    }
}



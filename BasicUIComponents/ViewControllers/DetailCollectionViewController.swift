//
//  DetailCollectionViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 12.09.2021.
//

import UIKit

class DetailCollectionViewController: UIViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    struct Person {
        var name: String
        let lastname: String
        let govermentNumber: Int
    }
    
    var people = [Person(name: "Semih", lastname: "Unlu", govermentNumber: 1),
                  Person(name: "Ahmet", lastname: "Yilmaz", govermentNumber: 2),
                  Person(name: "Mehmet", lastname: "Demir", govermentNumber: 3),
                  Person(name: "Mustafa", lastname: "Celik", govermentNumber: 4),
                  Person(name: "Ayse", lastname: "Kurt", govermentNumber: 5),
                  Person(name: "Fatma", lastname: "Caglar", govermentNumber: 6),
                  Person(name: "Burak", lastname: "Sarsilmaz", govermentNumber: 7),
                  Person(name: "Deniz", lastname: "Cetin", govermentNumber: 8),
                  Person(name: "Emre", lastname: "Yalcin", govermentNumber: 9),
                  Person(name: "Pelin", lastname: "Yazar", govermentNumber: 10),
                  Person(name: "Nejla", lastname: "Ozhan", govermentNumber: 11)]
    
}

// MARK: - UICollectionViewDelegate
extension DetailCollectionViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension DetailCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCollectionViewCell
        cell.myLabel.text = String(people[indexPath.row].govermentNumber)
        cell.imageView.image = UIImage(named: "zikirmatik")
        return cell
    }
}

extension DetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
    }
}

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
        
        collectionView.collectionViewLayout = createCompositionalLayout()
        
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
    
    private func firstLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 20
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets (top: 0, leading: 15, bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func secondLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33),
                                              heightDimension: .absolute(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(1500))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .absolute(100),
                                                                          heightDimension: .fractionalHeight(1.0)), elementKind: "leading",
                                                        alignment: .leading)
        ]
        return section
    }
    
    private func thirdLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        
        return section
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (section, enviroment) -> NSCollectionLayoutSection in
            switch section {
            case 0: return self.firstLayoutSection()
            case 1: return self.secondLayoutSection()
            case 2: return self.thirdLayoutSection()
            default: return self.firstLayoutSection()
            }
        }
    }
    
    
    // .fractionalWidth .fractionalHeight = 1.0 bulundugu containera orani
    // .absolute 44 px dedigimde bu yuksekligi ya da genisligi kesin bir sekilde istiyorum
    // .estimate 44 px diyebilriz bu yuksekligi ya da genisligi ihtiyac halinde esneteilir
}

// MARK: - UICollectionViewDelegate
extension DetailCollectionViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension DetailCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCollectionViewCell
        cell.myLabel.text = String(people[indexPath.row].name)
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

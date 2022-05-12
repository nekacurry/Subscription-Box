//
//  NewBoxVC.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//
//

import UIKit

class NewBoxViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        // Instantiating the UICollectionView, using the default flow layout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
    
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        collectionView.collectionViewLayout =  CustomFlowLayout()
        
        return collectionView
    }()
    
    let data: [Category] = [
        Category(name: "Treats",image:"treat"),
        Category(name: "Toys", image: "toy"),
        Category(name: "Food", image: "food"),
        Category(name: "Grooming", image: "brush"),
        Category(name: "Accesories", image: "collar"),
        Category(name: "Meds", image: "meds")
    ]
    
    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension NewBoxViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell

        cell.imageView.image = UIImage(named: self.data[indexPath.row].image)
        cell.textLabel.text = "\(self.data[indexPath.row].name)"
        cell.textLabel.textColor = UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: CollectionViewCell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor(red: 0.83, green: 0.77, blue: 0.98, alpha: 1.00)
        print("Selected an Item")
    }
}

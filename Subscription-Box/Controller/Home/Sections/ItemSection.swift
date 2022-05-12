//
//  ItemSection.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

struct ItemSection: Section {
    var numberOfItems = 6
    
    let item = Item(name: "Dental Bone", image: "example")
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.33))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.35))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ItemCell.self), for: indexPath) as! ItemCell
        cell.itemImage.image = UIImage(named: item.image)
        cell.itemLabel.text = "\(item.name)"
        return cell
    }
    
}

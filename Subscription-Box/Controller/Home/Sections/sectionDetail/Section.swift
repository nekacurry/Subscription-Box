//
//  Section.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection?
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

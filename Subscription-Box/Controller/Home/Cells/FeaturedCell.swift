//
//  FeaturedCell.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    static var identifier: String = "FeaturedCell"
    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var featuredLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func set(title: String) {
        featuredLabel.text = title
    }
    
    func setup(){
        self.layer.cornerRadius = 10
    }

}

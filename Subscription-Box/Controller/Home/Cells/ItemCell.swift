//
//  ItemCell.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class ItemCell: UICollectionViewCell {
    static var identifier: String = "ItemCell"
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        itemImage.layer.cornerRadius = 10
    }

}

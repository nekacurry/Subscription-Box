//
//  TitleCell.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class TitleCell: UICollectionViewCell {
    static var identifier: String = "TitleCell"
    @IBOutlet weak var LblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(title: String) {
        LblTitle.text = title
    }
}

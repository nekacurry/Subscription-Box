//
//  ItemViewCell.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//
//

import UIKit

class ItemViewCell: UITableViewCell {

    static var identifier = "ItemCell"
        
        let background: UIView = {
            let background = UIView()
            background.layer.cornerRadius = 5
            background.layer.masksToBounds = true
            background.translatesAutoresizingMaskIntoConstraints = false
            return background
        }()
    
    let itemImage: UIImageView = {
        let itemImage = UIImageView()
        itemImage.contentMode = .scaleAspectFit
        itemImage.clipsToBounds = true
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        return itemImage
    }()

        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        
    func setContents(item: Item){
            textLabel?.text = item.name

        }

}

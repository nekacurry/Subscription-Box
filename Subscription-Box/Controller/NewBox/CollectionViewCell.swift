//
//  CollectionViewCell.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static var identifier: String = "CCell"
    var textLabel: UILabel!
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        
        self.contentView.addSubview(imageView)
        
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            textLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
        
        
        //Customization
        self.backgroundColor = UIColor(red: 0.77, green: 0.87, blue: 0.96, alpha: 1.00)
        self.textLabel = textLabel
        self.textLabel.font = UIFont(name: "Helvetica", size: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

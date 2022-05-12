//
//  PastBoxesCell.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/30/22.
//

import UIKit

class PastBoxesCell: UITableViewCell {
    
    static var identifier = "pastBoxesCell"
    
    let background: UIView = {
        let background = UIView()
        background.layer.cornerRadius = 5
        background.backgroundColor = #colorLiteral(red: 0.8826949, green: 0.8753085732, blue: 0.994002521, alpha: 1)
        background.layer.masksToBounds = true
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let boxImage: UIImageView = {
        let boxImage = UIImageView()
        boxImage.contentMode = .scaleAspectFit
        boxImage.clipsToBounds = true
        boxImage.translatesAutoresizingMaskIntoConstraints = false
        return boxImage
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup(){
        self.contentView.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        
    }
    
    func setContents(box: Box){
        textLabel?.text = box.date

    }

}

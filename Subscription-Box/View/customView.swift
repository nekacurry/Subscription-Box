//
//  customView.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class customView: UIView {
    
    var message: String!
    var imageName: String!
    var isLastPage: Bool = false
    var color: UIColor!
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = UIColor(white: 1.0, alpha: 0.8)
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Subscribe Now", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        return button
    }()
    
    required init(message:String, imageName: String, isLastPage: Bool, color: UIColor){
        super.init(frame: .zero)
        self.message = message
        self.imageName = imageName
        self.isLastPage = isLastPage
        self.color = color
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        self.backgroundColor = color
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.65),
            stackView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.5),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        let image = UIImage(named: self.imageName)
        imageView.image = image
        self.addSubview(imageView)
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        
        messageLabel.text = message
        self.addSubview(messageLabel)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(messageLabel)
        
        if isLastPage{
            self.addSubview(continueButton)
            NSLayoutConstraint.activate([
                continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
                continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
                continueButton.topAnchor.constraint(equalTo: stackView.bottomAnchor),
                continueButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        
    }
    
    func setGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.0,3.0]
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        setGradient()
    }

}

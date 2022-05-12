//
//  LoginVC.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/30/22.
//

import UIKit

class LoginVC: UIViewController {
    
    var titleConstraintStart: NSLayoutConstraint!
    var titleConstraintEnd: NSLayoutConstraint!
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "PetBox"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont(name: "Marker Felt", size: 80)
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        return button
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "box")
        return imageView
    }()
    
    let usernameTextField: SimpleTextField = {
        let textField = SimpleTextField(placeholder: "username")
        return textField
    }()
    
    let passwordTextField: SimpleTextField = {
        let textField = SimpleTextField(placeholder: "password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        titleConstraintStart.isActive = false
        titleConstraintEnd.isActive = true
        UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, animations: {
            self.view.layoutIfNeeded()
            self.appNameLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.4039215686, blue: 1, alpha: 1)
        setImageView()
        setLabel()
        setButton()
        setTextFields()
        
    }
    
    
    func setImageView(){
        self.view.addSubview(mainImage)
        mainImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20).isActive = true
    }
    
    func setLabel(){
        self.view.addSubview(appNameLabel)
        appNameLabel.centerYAnchor.constraint(equalTo: mainImage.topAnchor, constant: -60).isActive = true
        appNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        appNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleConstraintEnd = appNameLabel.centerYAnchor.constraint(equalTo: mainImage.topAnchor, constant: -60)
        titleConstraintStart = appNameLabel.centerYAnchor.constraint(equalTo: mainImage.centerYAnchor, constant: 5)
        titleConstraintStart.isActive = true
        appNameLabel.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    func setButton(){
        self.view.addSubview(continueButton)
        continueButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        continueButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    func setTextFields(){
        self.view.addSubview(usernameTextField)
        usernameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 30).isActive = true
        usernameTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
        
        self.view.addSubview(passwordTextField)
        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
    }
    
    //MARK: Login Action
    @objc func loginTapped(){
        let nextVC = TabBarController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    

}

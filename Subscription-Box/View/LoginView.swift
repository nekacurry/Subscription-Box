//
//  LoginView.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

class LoginView: UIView {
    
    var title: String!
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let usernameField: UITextField = {
        let username = UITextField()
        return username
    }()
    
    let passwordField: UITextField = {
        let password = UITextField()
        return password
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        return button
    }()
    

}

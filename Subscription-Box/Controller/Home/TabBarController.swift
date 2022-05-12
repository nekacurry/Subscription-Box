//
//  TabBarController.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.delegate = self
    }
    
    func setupViewControllers(){
        self.tabBar.barTintColor = UIColor.black
        self.tabBar.tintColor = UIColor.white
        
        //==============
        let HomeVc = HomePageVC()
        HomeVc.title = "Home"
        //-----
        let navController = UINavigationController(rootViewController:HomeVc)
        HomeVc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        
        //===============
        let vc2 = NewBoxViewController()
        vc2.title = "New Box"
        //--
        let navController2 = UINavigationController(rootViewController: vc2)
        vc2.tabBarItem = UITabBarItem(title: "New Box", image: UIImage(named: "product"), tag: 1)
        
        //===============
        let vc3 = PastBoxesVC()
        vc3.title = "Past Orders"
        //--
        let navController3 = UINavigationController(rootViewController: vc3)
        vc3.tabBarItem = UITabBarItem(title: "History", image: UIImage(named: "clock"), tag: 2)
        
        //The Views - The list
        viewControllers = [navController,navController2,navController3]
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")
    }

}

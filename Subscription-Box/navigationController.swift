//
//  navigationController.swift
//  Subscription-Box
//
//  Created by Anneka Curry on 4/26/22.
//

import UIKit

extension UINavigationController {

    func initRootViewController(vc: UIViewController, transitionType type: String = "kCATransitionFade", duration: CFTimeInterval = 0.3) {
        self.viewControllers.removeAll()
        self.pushViewController(vc, animated: false)
        self.popToRootViewController(animated: false)
    }

}

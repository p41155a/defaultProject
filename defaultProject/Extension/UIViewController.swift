//
//  UIViewController.swift
//  defaultProject
//
//  Created by Yoojin Park on 2021/01/25.
//

import UIKit

extension UIViewController: Storyboarded {
    func setNavigationHidden(_ isHidden: Bool) {
        self.navigationController?.navigationBar.isHidden = isHidden
    }
    
    func setTransparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = Asset.white.color
    }
    
    func setNavigationBarTintColor(_ color: UIColor) {
        self.navigationController?.navigationBar.tintColor = color
    }
    
    func setNavigationBackButton() {
        self.navigationController?.navigationBar.backIndicatorImage =
            Asset.icAppbarBack.image
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = Asset.icAppbarBack.image
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

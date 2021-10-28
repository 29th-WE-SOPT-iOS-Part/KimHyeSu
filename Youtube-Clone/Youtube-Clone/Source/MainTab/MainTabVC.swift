//
//  MainTabVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/19.
//

import UIKit

class MainTabVC: UITabBarController {

    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbarClear()
    }
    
    // MARK: - UI Setting
    func setTabbarClear() {
        self.tabBar.layer.borderWidth = 0.50
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.clipsToBounds = true
        self.tabBar.backgroundImage = UIImage()
    }
}

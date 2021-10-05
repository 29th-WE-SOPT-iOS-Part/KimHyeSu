//
//  LoginFristVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/06.
//

import UIKit

class LoginFristVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - UI setting
    func setUI() {
        setButtonUI()
    }

    func setButtonUI() {
        nextButton.layer.cornerRadius = 10
    }

}

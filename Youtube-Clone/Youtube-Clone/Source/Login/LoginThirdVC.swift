//
//  LoginThirdVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/06.
//

import UIKit

class LoginThirdVC: UIViewController {

    @IBOutlet weak var doneButton: UIButton!

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
        doneButton.layer.cornerRadius = 10
    }

}

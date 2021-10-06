//
//  LoginThirdVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/06.
//

import UIKit

class LoginThirdVC: UIViewController {

    var name: String?
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nameTextLabel: UILabel!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    // MARK: - UI setting
    func setUI() {
        setButtonUI()
    }

    func setButtonUI() {
        doneButton.layer.cornerRadius = 10
    }
    
    // MARK: - Data setting
    func setData(){
        nameTextLabel.text = "\(name!)님\n환영합니다!"
    }

}

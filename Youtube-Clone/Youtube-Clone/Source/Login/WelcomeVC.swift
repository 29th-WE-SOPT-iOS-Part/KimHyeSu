//
//  LoginThirdVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/06.
//

import UIKit

class WelcomeVC: UIViewController {

    // MARK: - Property
    var name: String?
    
    // MARK: - IBOutlet
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
    
    // MARK: - IBAction
    @IBAction func doneButtonClicked(_ sender: Any) {
        guard let mainTabVC = UIStoryboard(name: "MainTab", bundle: nil).instantiateViewController(withIdentifier: "MainTabVC") as? MainTabVC else { return }
        mainTabVC.modalPresentationStyle = .fullScreen
        self.present(mainTabVC, animated: true, completion: nil)
    }
    
    @IBAction func loginOtherButtonClicked(_ sender: Any) {
        guard let preVC = self.presentingViewController as? UINavigationController else { return }
        self.dismiss(animated: true) {
            preVC.popToRootViewController(animated: true)
        }
    }
}

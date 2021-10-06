//
//  LoginFristVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/06.
//

import UIKit

class LoginFristVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - UI setting
    func setUI() {
        setButtonUI()
        setNavigationBarUI()
    }

    func setButtonUI() {
        nextButton.layer.cornerRadius = 10
    }
    
    func setNavigationBarUI(){
        self.navigationController?.navigationBar.isHidden = true
    }

    // MARK: - IBAction
    @IBAction func joinButtonClicked(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginSecondVC") as? LoginSecondVC else { return }
        self.navigationController?.pushViewController(joinVC, animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginThirdVC") as? LoginThirdVC else { return }
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}

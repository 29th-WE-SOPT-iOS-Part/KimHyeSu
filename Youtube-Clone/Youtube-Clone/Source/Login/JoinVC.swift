//
//  LoginSecondVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/06.
//

import UIKit

class JoinVC: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pwButton: UIButton!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        textfieldChange()
    }
    
    // MARK: - UI setting
    func setUI() {
        setButtonUI()
    }

    func setButtonUI() {
        nextButton.layer.cornerRadius = 10
    }
    
    func textfieldChange() {
        [nameTextField, emailTextField, pwTextField].forEach {
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    // MARK: - Objc func
    @objc func textFieldDidChange() {
        let isAllTextFieldHasText = nameTextField.hasText && emailTextField.hasText && pwTextField.hasText
        nextButton.isEnabled = isAllTextFieldHasText
        nextButton.backgroundColor = isAllTextFieldHasText ? .systemBlue : .lightGray
    }
    
    // MARK: - IBAction
    @IBAction func nextButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginThirdVC") as? WelcomeVC else {
            return
        }
        nextVC.name = nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func pwButtonClicked(_ sender: Any) {
        pwTextField.isSecureTextEntry.toggle()
        
        if !pwTextField.isSecureTextEntry {
            pwButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            pwButton.tintColor = .systemBlue
        } else {
            pwButton.setImage(UIImage(systemName: "square"), for: .normal)
            pwButton.tintColor = .black
        }
    }
}

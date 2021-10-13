//
//  SignInVC.swift
//  Youtube-Clone-Codebase
//
//  Created by 김혜수 on 2021/10/13.
//

import UIKit

class SignInVC: SignBaseVC {
    
    // MARK: - UI Component
    var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("계정 만들기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }
    
    // MARK: - UI setting
    override func setLayout() {
        super.setLayout()
        
        [signUpButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
     
        signUpButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 73).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 68).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 64).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 74).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    // MARK: - Button Action Setting
    func setButtonAction() {
        nextButton.addTarget(self, action: #selector(signInButtonClicked(_:)), for: .touchUpInside)
    }
    
    // MARK: - Objc function
    @objc func signUpButtonClicked(_ sender: UIButton) {
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    
    @objc func signInButtonClicked(_ sender: UIButton) {
        let welcomeVC = WelcomeVC()
        welcomeVC.name = idTextField.text!
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
}

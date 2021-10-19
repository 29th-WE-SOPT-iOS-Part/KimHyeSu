//
//  SignUpVC.swift
//  Youtube-Clone-Codebase
//
//  Created by 김혜수 on 2021/10/13.
//

import UIKit

class SignUpVC: SignBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }

    // MARK: - UI Setting
    override func setViewControllerUI() {
        super.setViewControllerUI()
        titleLabel.text = "회원가입"
        descriptionLabel.isHidden = true
    }
    
    override func setLayout() {
        super.setLayout()
        
        nextButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 64).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    // MARK: - Button Action Setting
    func setButtonAction() {
        nextButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    // MARK: - Objc function
    @objc func signUpButtonClicked() {
        let welcomeVC = WelcomeVC()
        welcomeVC.name = idTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
    }
}

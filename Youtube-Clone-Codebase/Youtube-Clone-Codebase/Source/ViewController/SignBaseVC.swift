//
//  SignBaseVC.swift
//  Youtube-Clone-Codebase
//
//  Created by 김혜수 on 2021/10/13.
//

import UIKit

class SignBaseVC: UIViewController {
    
    // MARK: - UI Component
    var googleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imgGoogle")
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인"
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.semibold)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Youtube로 이동하여 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다."
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var idTextField: SignTextField = {
        let textField = SignTextField()
        textField.setTextField(placeholder: "이름을 입력해주세요", secure: false)
        return textField
    }()

    var emailTextField: SignTextField = {
        let textField = SignTextField()
        textField.setTextField(placeholder: "이메일 또는 휴대전화", secure: false)
        return textField
    }()
  
    var pwTextField: SignTextField = {
        let textField = SignTextField()
        textField.setTextField(placeholder: "비밀번호 입력", secure: true)
        return textField
    }()
    
    var nextButton = SignButton()
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldEmpty()
    }
    
    // MARK: - UI Setting
    func setUI() {
        setNavigationBarUI()
        setViewControllerUI()
        setLayout()
    }
    
    func setNavigationBarUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setViewControllerUI() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        let googleImageViewLayout = [
            googleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 69),
            googleImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            googleImageView.widthAnchor.constraint(equalToConstant: 117),
            googleImageView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let loginLabelLayout = [
            titleLabel.topAnchor.constraint(equalTo: googleImageView.bottomAnchor, constant: 22),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ]
    
        let descriptionLabelLayout = [
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ]
        
        let idTextFieldLayout = [
            idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 128),
            idTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            idTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            idTextField.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let emailTextFieldLayout = [
            emailTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 17),
            emailTextField.widthAnchor.constraint(equalTo: idTextField.widthAnchor, multiplier: 1),
            emailTextField.heightAnchor.constraint(equalTo: idTextField.heightAnchor, multiplier: 1),
            emailTextField.centerXAnchor.constraint(equalTo: idTextField.centerXAnchor, constant: 0)
        ]
        
        let pwTextFieldLayout = [
            pwTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            pwTextField.widthAnchor.constraint(equalTo: idTextField.widthAnchor, multiplier: 1),
            pwTextField.heightAnchor.constraint(equalTo: idTextField.heightAnchor, multiplier: 1),
            pwTextField.centerXAnchor.constraint(equalTo: idTextField.centerXAnchor, constant: 0)
        ]
        
        [googleImageView, titleLabel, descriptionLabel, idTextField, emailTextField, pwTextField, nextButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [googleImageViewLayout, loginLabelLayout, descriptionLabelLayout, idTextFieldLayout, emailTextFieldLayout, pwTextFieldLayout].forEach {
            NSLayoutConstraint.activate($0)
        }
    }
    
    // MARK: - Textfield Setting
    func setTextField() {
        [idTextField, emailTextField, pwTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    func setTextFieldEmpty() {
        [idTextField, emailTextField, pwTextField].forEach {
            $0.text = ""
        }
    }
    
    // MARK: - Objc function
    @objc func textFieldDidChange() {
        if idTextField.hasText,
           emailTextField.hasText,
           pwTextField.hasText {
            nextButton.isEnabled = true
            nextButton.backgroundColor = .systemBlue
            
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .systemGray4
        }
    }
}



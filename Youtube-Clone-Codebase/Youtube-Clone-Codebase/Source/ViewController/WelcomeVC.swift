//
//  WelcomeVC.swift
//  Youtube-Clone-Codebase
//
//  Created by 김혜수 on 2021/10/13.
//

import UIKit

class WelcomeVC: UIViewController {
    
    // MARK: - Property
    var name: String?
    
    // MARK: - UI Component
    var googleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imgGoogle")
        return imageView
    }()
    
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var okButton: SignButton = {
        let button = SignButton()
        button.setTitle("확인", for: .normal)
        button.addTarget(self, action: #selector(completeButtonClicked), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("다른 계정으로 로그인하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.sizeToFit()
        button.addTarget(self, action: #selector(dismissButtonClicked), for: .touchUpInside)
        return button
    }()

    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    // MARK: - UI Setting
    func setUI() {
        setLayout()
        setViewControllerUI()
    }
    
    func setViewControllerUI() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        [googleImageView, welcomeLabel, okButton, dismissButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let googleImageViewLayout = [
            googleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 207),
            googleImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            googleImageView.widthAnchor.constraint(equalToConstant: 117),
            googleImageView.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let welcomeLabelLayout = [
            welcomeLabel.topAnchor.constraint(equalTo: googleImageView.bottomAnchor, constant: 14),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ]
        
        let okButtonLayout = [
            okButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 53),
            okButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            okButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            okButton.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let dismissButtonLayout = [
            dismissButton.topAnchor.constraint(equalTo: okButton.bottomAnchor, constant: 23),
            dismissButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ]
        
        [googleImageViewLayout, welcomeLabelLayout, okButtonLayout, dismissButtonLayout].forEach {
            NSLayoutConstraint.activate($0)
        }
    }
    
    // MARK: - Data Setting
    func setData() {
        welcomeLabel.text = "\(String(describing: name!))님\n환영합니다!"
    }
    
    // MARK: - Objc function
    @objc func completeButtonClicked() {
        print("탭바 화면 전환")
    }
    
    @objc func dismissButtonClicked() {
        guard let preVC = self.presentingViewController as? UINavigationController else { return }
        self.dismiss(animated: true) {
            preVC.popToRootViewController(animated: true)
        }
    }

}

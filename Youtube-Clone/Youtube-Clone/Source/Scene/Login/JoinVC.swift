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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldEmpty()
    }
    
    // MARK: - UI setting
    func setUI() {
        setButtonUI()
    }
    
    func setButtonUI() {
        nextButton.layer.cornerRadius = 10
    }
    
    // MARK: - Custom Function
    func textfieldChange() {
        [nameTextField, emailTextField, pwTextField].forEach {
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    func setTextFieldEmpty() {
        [nameTextField, emailTextField, pwTextField].forEach {
            $0.text = ""
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
        UserService.shared.userJoin(email: emailTextField.text ?? "",
                                    name: nameTextField.text ?? "",
                                    password: pwTextField.text ?? "") { res in
            switch res {
            case .success(let data):
                guard let data = data as? UserResponseModel else { return }
                self.makeAlert(title: "회원가입",
                               message: data.message,
                               okAction: { _ in
                    
                    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginThirdVC") as? WelcomeVC else {
                        return
                    }
                    UserDefaults.standard.set(data.data?.name, forKey: "name")
                    nextVC.modalPresentationStyle = .fullScreen
                    self.present(nextVC, animated: true, completion: nil)
                })
            case .pathErr: print("pathErr")
            case .requestErr(let data):
                guard let data = data as? UserResponseModel else { return }
                self.makeAlert(title: "회원가입",
                               message: data.message,
                               okAction: nil, completion: nil)
                print("requestErr")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
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

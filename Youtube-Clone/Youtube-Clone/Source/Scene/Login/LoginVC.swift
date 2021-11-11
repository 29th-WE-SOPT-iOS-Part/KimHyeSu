//
//  LoginFristVC.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/10/06.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        textFieldChange()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldEmpty()
    }
    
    // MARK: - UI setting
    func setUI() {
        setLabelUI()
        setButtonUI()
        setNavigationBarUI()
    }
    
    func setLabelUI() {
        descriptionLabel.text = "Youtube로 이동하여 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다."
    }
    
    func setButtonUI() {
        nextButton.layer.cornerRadius = 10
    }
    
    func setNavigationBarUI(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Custom Function
    func textFieldChange() {
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
    @IBAction func joinButtonClicked(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginSecondVC") as? JoinVC else { return }
        self.navigationController?.pushViewController(joinVC, animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        UserService.shared.userLogin(email: emailTextField.text ?? "",
                                     password: pwTextField.text ?? "") { res in
            
            switch res {
            case .success(let data):
                guard let data = data as? LoginResponseModel else { return }
                self.makeAlert(title: "로그인",
                               message: data.message,
                               okAction: { _ in
                    if data.status == 200 {
                        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginThirdVC") as? WelcomeVC else { return }
                        nextVC.name = data.data?.name
                        nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: true, completion: nil)
                    }
                })
            case .pathErr: print("pathErr")
            case .requestErr(_): print("requestErr")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
}

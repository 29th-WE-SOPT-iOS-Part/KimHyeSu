//
//  SignTextField.swift
//  Youtube-Clone-Codebase
//
//  Created by 김혜수 on 2021/10/13.
//

import UIKit

class SignTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUI() {
        self.keyboardType = .default
        self.borderStyle = .roundedRect
        self.clearButtonMode = .whileEditing
        self.autocorrectionType = .no
        self.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    
    func setTextField(placeholder: String, secure: Bool) {
        self.placeholder = placeholder
        self.isSecureTextEntry = secure
    }
}

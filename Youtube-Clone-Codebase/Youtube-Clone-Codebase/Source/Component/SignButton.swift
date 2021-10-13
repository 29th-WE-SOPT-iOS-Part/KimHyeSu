//
//  BlueButton.swift
//  Youtube-Clone-Codebase
//
//  Created by 김혜수 on 2021/10/13.
//

import UIKit

class SignButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.setTitle("다음", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        self.backgroundColor = .systemGray4
        self.layer.cornerRadius = 5
        self.isEnabled = false
    }
    
}

//
//  LoginRequestModel.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/11/11.
//

import Foundation

// MARK: - LoginRequestModel
struct LoginRequestModel: Codable {
    let email, password: String
}

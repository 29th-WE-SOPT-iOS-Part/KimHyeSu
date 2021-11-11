//
//  LoginResponseModel.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/11/11.
//

import Foundation

// MARK: - LoginResponseModel
struct LoginResponseModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResponseData?
}

// MARK: - DataClass
struct LoginResponseData: Codable {
    let id: Int
    let name, email: String
}

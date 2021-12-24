//
//  LoginResponseModel.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/11/11.
//

import Foundation

// MARK: - LoginResponseModel
struct UserResponseModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: UserResponseData?
}

// MARK: - DataClass
struct UserResponseData: Codable {
    let id: Int
    let name, email: String
}

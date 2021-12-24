//
//  JoinRequestModel.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/11/11.
//

import Foundation

// MARK: - JoinRequestModel
struct JoinRequestModel: Codable {
    let email, name, password: String
}

//
//  UserService.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/11/11.
//


import UIKit

import Alamofire

struct UserService {
    
    static let shared = UserService()
    
    // MARK: - Login
    func userLogin(email: String, password: String,
                   completion: @escaping (NetworkResult<Any>) -> Void) {
        
        AF.request(UserRouter.userLogin(login: LoginRequestModel(email: email, password: password)))
            .validate(statusCode: 200...500)
            .responseData { res in
                switch res.result {
                case .success(let data):
                    print(res)
                    switch res.response?.statusCode {
                    case 200, 400:
                        guard let jsonData = try? JSONDecoder().decode(LoginResponseModel.self, from: data) else { return }
                        return completion(.success(jsonData))
                        
                    default: completion(.networkFail)
                    }
                    
                case .failure(let err):
                    print(err)
                }
            }
    }
}

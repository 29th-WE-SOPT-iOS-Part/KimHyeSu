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
                    case 200:
                        guard let jsonData = try? JSONDecoder().decode(UserResponseModel.self, from: data) else { return }
                        return completion(.success(jsonData))
                    case 400:
                        guard let jsonData = try? JSONDecoder().decode(UserResponseModel.self, from: data) else { return }
                        return completion(.requestErr(jsonData))
                    default: completion(.networkFail)
                    }
                    
                case .failure(let err):
                    print(err)
                }
            }
    }
    
    // MARK: - Join
    func userJoin(email: String, name: String, password: String,
                  completion: @escaping (NetworkResult<Any>) -> Void) {
        
        AF.request(UserRouter.userJoin(join: JoinRequestModel(email: email, name: name, password: password)))
            .validate(statusCode: 200...500)
            .responseData { res in
                switch res.result {
                case .success(let data):
                    print(res)
                    switch res.response?.statusCode {
                    case 200:
                        guard let jsonData = try? JSONDecoder().decode(UserResponseModel.self, from: data) else { return }
                        return completion(.success(jsonData))
                    case 400:
                        guard let jsonData = try? JSONDecoder().decode(UserResponseModel.self, from: data) else { return }
                        return completion(.requestErr(jsonData))
                    default: completion(.networkFail)
                    }
                    
                case .failure(let err):
                    print(err)
                }
            }
    }
}

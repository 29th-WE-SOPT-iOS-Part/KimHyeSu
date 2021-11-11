//
//  UserRouther.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/11/11.
//

import Foundation

import Alamofire

enum UserRouter: URLRequestConvertible {
    
    case userLogin(login: LoginRequestModel)
    
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var method: HTTPMethod {
        switch self {
        case .userLogin: return .post
        }
    }
    
    var path: String {
        switch self {
        case .userLogin: return APIConstants.loginURL
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .userLogin: return ["Content-Type": "application/json"]
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .userLogin(let login): return ["email": "\(login.email)",
                                            "password" : "\(login.password)"]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        switch self {
        case .userLogin: request = try JSONParameterEncoder().encode(parameters, into: request)
        }
        
        return request
    }
}

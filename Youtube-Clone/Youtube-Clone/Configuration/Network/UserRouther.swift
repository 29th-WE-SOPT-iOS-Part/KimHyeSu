//
//  UserRouther.swift
//  Youtube-Clone
//
//  Created by κΉνμ on 2021/11/11.
//

import Foundation

import Alamofire

enum UserRouter: URLRequestConvertible {
    
    case userLogin(login: LoginRequestModel)
    case userJoin(join: JoinRequestModel)
    
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var method: HTTPMethod {
        switch self {
        case .userLogin, .userJoin: return .post
        }
    }
    
    var path: String {
        switch self {
        case .userLogin: return APIConstants.loginURL
        case .userJoin: return APIConstants.joinURL
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .userLogin, .userJoin: return ["Content-Type": "application/json"]
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .userLogin(let login): return ["email": login.email,
                                            "password": login.password]
        case .userJoin(let join): return ["email": join.email,
                                          "name": join.name,
                                          "password": join.password]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        switch self {
        case .userLogin, .userJoin: request = try JSONParameterEncoder().encode(parameters, into: request)
        }
        
        return request
    }
}

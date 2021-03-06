//
//  NetworkResult.swift
//  Youtube-Clone
//
//  Created by κΉνμ on 2021/11/11.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

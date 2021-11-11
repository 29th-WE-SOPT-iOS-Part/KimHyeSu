//
//  NetworkResult.swift
//  Youtube-Clone
//
//  Created by 김혜수 on 2021/11/11.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}

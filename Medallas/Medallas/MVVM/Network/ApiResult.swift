//
//  ApiResult.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

enum ApiResult<T> {
    case success(data: T)
    case error(error: ErrorType)
}

enum ErrorType: Error {
    case notFound
    case connection
}

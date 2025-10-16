//
//  WebserviceProtocol.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol WebserviceProtocol {
    func loadJSON<T: Decodable>(from fileName: String, as type: T.Type) -> ApiResult<T>
}

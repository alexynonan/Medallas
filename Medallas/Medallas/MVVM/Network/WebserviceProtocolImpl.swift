//
//  WebserviceProtocolImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

import Foundation

final class WebserviceProtocolImpl: WebserviceProtocol {
    
    func loadJSON<T: Decodable>(from fileName: String, as type: T.Type) -> ApiResult<T> {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("❌ Archivo \(fileName).json no encontrado en el bundle principal.")
            return .error(error: .notFound)
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decoded = try decoder.decode(T.self, from: data)
            return .success(data: decoded)
        } catch {
            print("❌ Error al decodificar \(fileName).json: \(error.localizedDescription)")
            return .error(error: .connection)
        }
    }
}

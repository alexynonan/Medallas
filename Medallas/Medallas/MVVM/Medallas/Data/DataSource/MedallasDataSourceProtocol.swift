//
//  MedallasDataSourceProtocol.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol MedallasDataSourceProtocol {
    func fetchMedallas(
        completion: @escaping (ApiResult<[ApiMedallas]?>) -> Void
    )
}

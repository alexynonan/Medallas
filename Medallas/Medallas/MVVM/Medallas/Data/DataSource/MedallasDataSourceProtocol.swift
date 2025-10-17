//
//  MedallasDataSourceProtocol.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol MedallasDataSourceProtocol {
    func fetchMedallas() async -> ApiResult<[ApiMedallas]>
    func saveMedallasLocal(_ medallas: [Medalla])
    func fetchMedallasLocal() -> [CDMedallas]
    func deleteAllMedallasLocal()
}

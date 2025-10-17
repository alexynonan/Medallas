//
//  MedallasRepository.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol MedallasRepository {
    func fetchMedallas() async -> ApiResult<[Medalla]>
}

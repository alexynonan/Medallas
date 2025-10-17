//
//  FetchMedallasUseCase.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol FetchMedallasUseCase {
    func fetchMedallas() async -> ApiResult<[UIMedalla]>
}

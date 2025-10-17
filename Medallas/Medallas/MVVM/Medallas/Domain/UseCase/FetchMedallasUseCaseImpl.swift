//
//  FetchMedallasUseCaseImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

class FetchMedallasUseCaseImpl: FetchMedallasUseCase {
    
    let repository: MedallasRepository
    
    init(repository: MedallasRepository) {
        self.repository = repository
    }
    
    func fetchMedallas() async -> ApiResult<[UIMedalla]> {
        await repository.fetchMedallas()
    }
}

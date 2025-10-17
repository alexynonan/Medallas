//
//  FetchMedallasUseCaseImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

class FetchMedallasUseCaseImpl: FetchMedallasUseCase {
    
    let repository: MedallasRepository
    let mapper: MedallasDomainMapper
    
    init(
        repository: MedallasRepository,
        mapper: MedallasDomainMapper
    ) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func fetchMedallas() async -> ApiResult<[UIMedalla]> {
        let result = await repository.fetchMedallas()
        switch result {
        case .success(let data):
            return .success(data: self.mapper.domainToPresentation(data))
        case .error(let error):
            return .error(error: error)
        }
    }
}

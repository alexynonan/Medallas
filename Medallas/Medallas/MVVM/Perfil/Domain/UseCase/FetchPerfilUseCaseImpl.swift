//
//  FetchPerfilUseCaseImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

class FetchPerfilUseCaseImpl: FetchPerfilUseCase {
    
    let repository: PerfilRepository
    let mapper: PerfilDomainMapper
    
    init(
        repository: PerfilRepository,
        mapper: PerfilDomainMapper
    ) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func fetchFuncionalidades() async -> ApiResult<[UIPerfilFuncionality]> {
        let result = await repository.fetchFuncionalidades()
        switch result {
        case .success(let data):
            return .success(data: self.mapper.domainToPresentation(data))
        case .error(let error):
            return .error(error: error)
        }
    }
}

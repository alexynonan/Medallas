//
//  PerfilRepositoryImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

final class PerfilRepositoryImpl: PerfilRepository {

    let mapper: PerfilDataMapper
    let dataSource: PerfilDataSource
    
    init(
        dataSource: PerfilDataSource,
        mapper: PerfilDataMapper
    ) {
        self.mapper = mapper
        self.dataSource = dataSource
    }
    
    func fetchFuncionalidades() async -> ApiResult<[PerfilFuncionality]> {
        let result = await dataSource.fetchFuncionalidades()
        switch result {
        case .success(let data):
            return .success(data: self.mapper.dataToDomain(data))
        case .error(let error):
            return .error(error: error)
        }
    }
}

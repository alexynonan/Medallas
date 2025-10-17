//
//  MedallasRepositoryImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

class MedallasRepositoryImpl: MedallasRepository {
    
    let dataSource: MedallasDataSourceProtocol
    let mapper: MedallasDataMapper
    
    init(
        dataSource: MedallasDataSourceProtocol,
        mapper: MedallasDataMapper
    ) {
        self.dataSource = dataSource
        self.mapper = mapper
    }
    
    func fetchMedallas() async -> ApiResult<[Medalla]> {
        let result = await dataSource.fetchMedallas()
        switch result {
        case .success(let data):
            let dataLocal = dataSource.fetchMedallasLocal()
            return .success(data: self.mapper.dataToDomain(dataLocal, data))
        case .error(let error):
            return .error(error: error)
        }
    }
    func saveMedallas(list: [Medalla]) {
        deleteMedallas()
        dataSource.saveMedallasLocal(list)
    }
    func deleteMedallas() {
        dataSource.deleteAllMedallasLocal()
    }
}

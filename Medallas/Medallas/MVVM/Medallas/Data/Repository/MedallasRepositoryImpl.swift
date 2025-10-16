//
//  MedallasRepositoryImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

import UIKit

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
    
    func fetchMedallas(completion: @escaping (ApiResult<[UIMedalla]>) -> Void) {
        dataSource.fetchMedallas { result in
            switch result {
            case .success(let data):
                completion(.success(data: self.mapper.dataToDomain(data)))
            case .error(let error):
                completion(.error(error: error))
            }
        }
    }
}

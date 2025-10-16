//
//  MedallasDataSourceImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

final class MedallasDataSourceImpl: MedallasDataSourceProtocol {
    
    private enum Constants {
        static let nameJson: String = "MedallasDataMock"
    }
    
    private let networkManager: WebserviceProtocol
    
    init(networkManager: WebserviceProtocol) {
        self.networkManager = networkManager
    }

    func fetchMedallas(
        completion: @escaping (ApiResult<[ApiMedallas]?>) -> Void
    ) {
        
        let result: ApiResult<[ApiMedallas]> = networkManager.loadJSON(
            from: Constants.nameJson,
            as: [ApiMedallas].self
        )
        
        switch result {
        case .success(let data):
            completion(.success(data: data))
        default:
            completion(.error(error: .notFound))
        }
    }
}

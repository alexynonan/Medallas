//
//  MedallasDataSourceImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

final class MedallasDataSourceImpl: MedallasDataSourceProtocol {
    
    private enum Constants {
        static let nameJson: String = "MedallasDataMock"
        static let seconds: Double = 1
    }
    
    private let networkManager: WebserviceProtocol
    
    init(networkManager: WebserviceProtocol) {
        self.networkManager = networkManager
    }

    func fetchMedallas() async -> ApiResult<[ApiMedallas]> {
        try? await Task.sleep(seconds: Constants.seconds)
        
        let result: ApiResult<[ApiMedallas]> = networkManager.loadJSON(
            from: Constants.nameJson,
            as: [ApiMedallas].self
        )
        switch result {
        case .success(let data):
            return .success(data: data)
        default:
            return .error(error: .notFound)
        }
    }
}

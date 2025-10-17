//
//  PerfilDataSourceImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

final class PerfilDataSourceImpl: PerfilDataSource {

    private enum Constants {
        static let nameJson: String = "PerfilFuncionalityDataMock"
        static let seconds: Double = 0.8
    }
    
    private let networkManager: WebserviceProtocol
    
    init(networkManager: WebserviceProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchFuncionalidades() async -> ApiResult<[ApiPerfilFuncionality]> {
        try? await Task.sleep(seconds: Constants.seconds)
        
        let result: ApiResult<[ApiPerfilFuncionality]> = networkManager.loadJSON(
            from: Constants.nameJson,
            as: [ApiPerfilFuncionality].self
        )
        switch result {
        case .success(let data):
            return .success(data: data)
        default:
            return .error(error: .notFound)
        }
    }
}

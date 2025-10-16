//
//  MedallasApp.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import SwiftUI

@main
struct MedallasApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                let networkManager = WebserviceProtocolImpl()
                let dataSource = MedallasDataSourceImpl(networkManager: networkManager)
                let mapper = MedallasDataMapperImpl()
                let repository = MedallasRepositoryImpl(
                    dataSource: dataSource,
                    mapper: mapper
                )
                let useCase = FetchMedallasUseCaseImpl(repository: repository)
                let viewModel = MedallaViewModel(fetchMedallasUseCase: useCase)
                MedallaUIView(viewModel: viewModel)
            }
        }
    }
}

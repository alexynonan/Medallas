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
                let dataSource = PerfilDataSourceImpl(networkManager: networkManager)
                let mapper = PerfilDataMapperImpl()
                let repository = PerfilRepositoryImpl(
                    dataSource: dataSource,
                    mapper: mapper
                )
                let mapperDomain = PerfilDomainMapperImpl()
                let useCase = FetchPerfilUseCaseImpl(
                    repository: repository,
                    mapper: mapperDomain
                )
                let viewModel = PerfilViewModel(
                    fetchPerfilUseCase: useCase,
                    medallaFactory: {
                        let dataSource = MedallasDataSourceImpl(networkManager: networkManager)
                        let mapper = MedallasDataMapperImpl()
                        let repository = MedallasRepositoryImpl(
                            dataSource: dataSource,
                            mapper: mapper
                        )
                        let useCase = FetchMedallasUseCaseImpl(repository: repository)
                        let viewModel = MedallaViewModel(fetchMedallasUseCase: useCase)
                        return viewModel
                    },
                    misionesFactory: {
                        let viewModel = MisionesViewModel()
                        return viewModel
                    },
                    rachasFactory: {
                        let viewModel = RachasViewModel()
                        return viewModel
                    },
                    albumFactory: {
                        let viewModel = AlbumViewModel()
                        return viewModel
                    }
                )
                PerfilUIView(viewModel: viewModel)
            }
        }
    }
}

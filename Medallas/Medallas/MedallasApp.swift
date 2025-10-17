//
//  MedallasApp.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import SwiftUI
import CoreData

@main
struct MedallasApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    let persistenceController = PersistenceController.shared
    
    @StateObject private var perfilViewModel: PerfilViewModel

    init() {
        let context = persistenceController.container.viewContext
        _perfilViewModel = StateObject(
            wrappedValue: MedallasApp.getViewModelProfile(context: context))
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PerfilUIView(viewModel: perfilViewModel)
            }
            
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .background:
                print("⏸️ Entro a segundo plano")
            case .active:
                print("▶️ App en primer plano")
            default:
                break
            }
        }
    }
    static func getViewModelProfile(context: NSManagedObjectContext) -> PerfilViewModel {
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
                let dataSource = MedallasDataSourceImpl(
                    networkManager: networkManager,
                    context: context
                )
                let mapper = MedallasDataMapperImpl()
                let repository = MedallasRepositoryImpl(
                    dataSource: dataSource,
                    mapper: mapper
                )
                let mapperDomain = MedallasDomainMapperImpl()
                let useCase = FetchMedallasUseCaseImpl(
                    repository: repository,
                    mapper: mapperDomain
                )
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
        return viewModel
    }
    
}

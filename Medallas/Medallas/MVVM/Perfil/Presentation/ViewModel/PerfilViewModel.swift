//
//  PerfilViewModel.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

import Combine

@MainActor
class PerfilViewModel: ObservableObject {

    private let fetchPerfilUseCase: FetchPerfilUseCase
    private var loadTask: Task<Void, Never>?
    
    @Published var isLoading: Bool = false
    @Published var funcionalitys: [UIPerfilFuncionality] = []
    
    private let medallaFactory: () -> MedallaViewModel
    private let misionesFactory: () -> MisionesViewModel
    private let rachasFactory: () -> RachasViewModel
    private let albumFactory: () -> AlbumViewModel
    
    init(
        fetchPerfilUseCase: FetchPerfilUseCase,
        medallaFactory: @escaping () -> MedallaViewModel,
        misionesFactory: @escaping () -> MisionesViewModel,
        rachasFactory: @escaping () -> RachasViewModel,
        albumFactory: @escaping () -> AlbumViewModel
    ) {
        self.fetchPerfilUseCase = fetchPerfilUseCase
        self.medallaFactory = medallaFactory
        self.misionesFactory = misionesFactory
        self.rachasFactory = rachasFactory
        self.albumFactory = albumFactory
    }

    func loadMedallas() {
        loadTask?.cancel()
        loadTask = Task {
            isLoading = true
            let result = await fetchPerfilUseCase.fetchFuncionalidades()
            if Task.isCancelled {
                isLoading = false
                return
            }
            switch result {
            case .success(data: let data):
                self.funcionalitys = data
            case .error:
                print("Error al obtener medallas")
            }
            isLoading = false
        }
    }
    func cancelTask() {
        loadTask?.cancel()
    }
    func redirectionMedallaDetalle() -> MedallaViewModel {
        medallaFactory()
    }
    func redirectionMisiones() -> MisionesViewModel {
        misionesFactory()
    }
    func redirectionRachas() -> RachasViewModel {
        rachasFactory()
    }
    func redirectionAlbum() -> AlbumViewModel {
        albumFactory()
    }
}

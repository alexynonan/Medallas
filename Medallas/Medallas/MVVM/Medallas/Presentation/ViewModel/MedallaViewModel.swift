//
//  MedallaViewModel.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import UIKit

final class MedallaViewModel: ObservableObject {
    
    let fetchMedallasUseCase: FetchMedallasUseCase
    
    @Published var medallas: [UIMedalla] = []
    
    init(
        fetchMedallasUseCase: FetchMedallasUseCase
    ) {
        self.fetchMedallasUseCase = fetchMedallasUseCase
    }
    
    func loadMedallas() {
        fetchMedallasUseCase.fetchMedallas { result in
            switch result {
            case .success(data: let users):
                self.medallas = users
            case .error:
                break
            }
        }
    }
    
    func redirectionMedallaDetalle() -> MedallaDetalleViewModel {
        MedallaDetalleViewModel()
    }
    func redirectionMisiones() -> MisionesViewModel {
        MisionesViewModel()
    }
    func redirectionRachas() -> RachasViewModel {
        RachasViewModel()
    }
    func redirectionAlbum() -> AlbumViewModel {
        AlbumViewModel()
    }
}

//
//  MedallaViewModel.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import Combine

@MainActor
final class MedallaViewModel: ObservableObject {
    
    private let fetchMedallasUseCase: FetchMedallasUseCase
    private var loadTask: Task<Void, Never>?
    
    @Published var isLoading: Bool = false
    @Published var medallas: [UIMedalla] = []
    
    init(
        fetchMedallasUseCase: FetchMedallasUseCase
    ) {
        self.fetchMedallasUseCase = fetchMedallasUseCase
    }
    
    func loadMedallas() {
        loadTask?.cancel()
        loadTask = Task {
            isLoading = true
//            let result = await fetchMedallasUseCase.fetchMedallas()
//            if Task.isCancelled {
//                isLoading = false
//                return
//            }
//            switch result {
//            case .success(data: let medallas):
//                self.medallas = medallas
//            case .error:
//                print("Error al obtener medallas")
//            }
//            isLoading = false
        }
    }
    func cancelTask() {
        loadTask?.cancel()
    }
}

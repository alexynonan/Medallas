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
    private var loadIncrementTask: Task<Void, Never>?
    
    @Published var isLoading: Bool = false
    @Published var medallas: [UIMedalla] = []
    @Published var maxPoints: Int = 100
    @Published var isRunning = false
    
    init(
        fetchMedallasUseCase: FetchMedallasUseCase
    ) {
        self.fetchMedallasUseCase = fetchMedallasUseCase
    }
    
    func loadMedallas() {
        loadTask?.cancel()
        loadTask = Task {
            isLoading = true
            let result = await fetchMedallasUseCase.fetchMedallas()
            if Task.isCancelled {
                isLoading = false
                return
            }
            switch result {
            case .success(data: let medallas):
                self.medallas = medallas
                startIncrementing()
            case .error:
                print("Error al obtener medallas")
            }
            isLoading = false
        }
    }

    func cancelTask() {
        loadTask?.cancel()
        stopIncrementing()
    }
    
    func startIncrementing() {
        guard !isRunning else { return }
        isRunning = true
        
        loadIncrementTask = Task {
            while isRunning {
                try? await Task.sleep(seconds: 1)

                for index in medallas.indices {
                    await incrementPoints(for: index)
                }
                // Persistimos el progreso
//                repository.save(medallas: medallas)
            }
        }
    }
    func stopIncrementing() {
        isRunning = false
        loadIncrementTask?.cancel()
        loadIncrementTask = nil
    }
    
    private func incrementPoints(for index: Int) async {
        let maxPuntos = 100
        
        guard medallas[index].level < medallas[index].maxLevel else { return }
        
        let incremento = Int.random(in: 0...maxPuntos)
        
        if incremento == maxPuntos {
            medallas[index].level += 1
            medallas[index].points = incremento
            medallas[index].showSuccessUpLevel = true
            try? await Task.sleep(seconds: 0.5)
            medallas[index].points = 0
        } else {
            medallas[index].showSuccessUpLevel = false
            medallas[index].points = incremento
        }
    }
}

//
//  MedallaViewModel.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 15/10/25.
//

import Combine

@MainActor
final class MedallaViewModel: ObservableObject {
    
    private enum Constants {
        static let maxPuntos = 100
        static let one = 1
        static let tapValueOne: Double = 1
        static let sleepSeconds: Double = 0.5
        static let startSeconds: Double = 4
        static let maxTaps = 5
    }
    
    private let fetchMedallasUseCase: FetchMedallasUseCase
    private let coreDataMedallasUseCase: CDMedallasUseCase
    private var loadTask: Task<Void, Never>?
    private var loadIncrementTask: Task<Void, Never>?
    private var loadTapTask: Task<Void, Never>?
    
    @Published var isLoading: Bool = false
    @Published var medallas: [UIMedalla] = []
    @Published var isRunning = false
    
    @Published var tapCount = 0
    @Published var didReach5Taps = false
    
    init(
        fetchMedallasUseCase: FetchMedallasUseCase,
        coreDataMedallasUseCase: CDMedallasUseCase
    ) {
        self.fetchMedallasUseCase = fetchMedallasUseCase
        self.coreDataMedallasUseCase = coreDataMedallasUseCase
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
        loadTapTask?.cancel()
        stopIncrementing()
        saveDataToCoreData()
        loadTapTask = nil
    }
    
    func saveDataToCoreData() {
        coreDataMedallasUseCase.saveMedallas(list: medallas)
    }
    func deleteDataFromCoreData() {
        coreDataMedallasUseCase.deleteMedallas()
    }
    func startIncrementing() {
        guard !isRunning else { return }
        isRunning = true
        
        loadIncrementTask = Task {
            while isRunning {
                try? await Task.sleep(seconds: Constants.startSeconds)

                for index in medallas.indices {
                    await incrementPoints(for: index)
                }
            }
        }
    }
    func stopIncrementing() {
        isRunning = false
        loadIncrementTask?.cancel()
        loadIncrementTask = nil
    }
    
    private func incrementPoints(for index: Int) async {
        guard medallas[index].level < medallas[index].maxLevel else { return }
        
        let incremento = Int.random(in: 0...Constants.maxPuntos)
        
        if incremento == Constants.maxPuntos {
            medallas[index].level += Constants.one
            medallas[index].points = incremento
            medallas[index].showSuccessUpLevel = true
            try? await Task.sleep(seconds: Constants.sleepSeconds)
            medallas[index].points = .zero
        } else {
            medallas[index].showSuccessUpLevel = false
            medallas[index].points = incremento
        }
    }
    
    func registerTap() {
        tapCount += 1
        if tapCount == Constants.maxTaps {
            deleteDataFromCoreData()
            tapCount = 0
            loadTapTask?.cancel()
            loadMedallas()
        } else {
            loadTapTask?.cancel()
            loadTapTask = Task {
                try? await Task.sleep(seconds: Constants.tapValueOne)
                if !Task.isCancelled && tapCount < Constants.maxTaps {
                    tapCount = 0
                }
            }
        }
    }
}

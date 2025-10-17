//
//  MedallasDataSourceImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//
import CoreData

final class MedallasDataSourceImpl: MedallasDataSourceProtocol {
    
    private enum Constants {
        static let nameJson: String = "MedallasDataMock"
        static let seconds: Double = 1
    }
    
    private let networkManager: WebserviceProtocol
    private let context: NSManagedObjectContext
        
    init(
        networkManager: WebserviceProtocol,
        context: NSManagedObjectContext
    ) {
        self.networkManager = networkManager
        self.context = context
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
    
    func saveMedallasLocal(_ medallas: [Medalla]) {
        for medalla in medallas {
            let fetchRequest: NSFetchRequest<MedallaEntity> = MedallaEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", medalla.id)
            
            if let existing = try? context.fetch(fetchRequest).first {
                existing.points = Int64(medalla.points)
                existing.level = Int64(medalla.level)
            } else {
                let new = MedallaEntity(context: context)
                new.id = medalla.id
                new.points = Int64(medalla.points)
                new.level = Int64(medalla.level)
            }
        }
        
        try? context.save()
    }
    
    func fetchMedallasLocal() -> [CDMedallas] {
        let request: NSFetchRequest<MedallaEntity> = MedallaEntity.fetchRequest()
        guard let results = try? context.fetch(request) else { return [] }
        
        return results.map {
            CDMedallas(
                id: $0.id ?? String(),
                points: Int($0.points),
                level: Int($0.level)
            )
        }
    }
    func deleteAllMedallasLocal() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = MedallaEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Error al eliminar todas las medallas: \\(error)")
        }
    }
}

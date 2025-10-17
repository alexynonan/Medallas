//
//  CDMedallasUseCaseImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 17/10/25.
//

final class CDMedallasUseCaseImpl: CDMedallasUseCase {
    
    let repository: MedallasRepository
    let mapper: MedallasDomainMapper
    
    init(
        repository: MedallasRepository,
        mapper: MedallasDomainMapper
    ) {
        self.repository = repository
        self.mapper = mapper
    }
    
    func saveMedallas(list: [UIMedalla]) {
        repository.saveMedallas(list: mapper.presentationToDomain(list))
    }
    
    func deleteMedallas() {
        repository.deleteMedallas()
    }
}

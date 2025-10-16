//
//  MedallasDataMapperImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

final class MedallasDataMapperImpl: MedallasDataMapper {
    
    func dataToDomain(_ value: [ApiMedallas]?) -> [UIMedalla] {
        value?.map {
            UIMedalla(
                name: $0.name,
                iconName: $0.icon,
                typeMedalla: $0.type
            )
        } ?? []
    }
}

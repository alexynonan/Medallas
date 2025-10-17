//
//  PerfilDataMapperImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//


final class PerfilDataMapperImpl: PerfilDataMapper {

    func dataToDomain(_ value: [ApiPerfilFuncionality]?) -> [PerfilFuncionality] {
        value?.map {
            PerfilFuncionality(
                name: $0.name,
                icon: $0.icon,
                type: $0.type
            )
        } ?? []
    }
}

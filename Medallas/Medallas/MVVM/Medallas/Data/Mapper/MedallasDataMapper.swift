//
//  MedallasDataMapper.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol MedallasDataMapper {
    func dataToDomain(_ value: [ApiMedallas]?) -> [UIMedalla]
}

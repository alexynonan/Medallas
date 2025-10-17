//
//  MedallasDataMapper.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol MedallasDataMapper {
    func dataToDomain(_ value: [ApiMedallas]?) -> [Medalla]
    func dataToDomain(_ value: [CDMedallas]?,_ value2: [ApiMedallas]?) -> [Medalla]
}

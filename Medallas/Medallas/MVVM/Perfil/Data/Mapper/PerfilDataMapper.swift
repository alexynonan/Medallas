//
//  PerfilDataMapper.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol PerfilDataMapper {
    func dataToDomain(_ value: [ApiPerfilFuncionality]?) -> [PerfilFuncionality]
}

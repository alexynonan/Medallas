//
//  MedallasDomainMapper.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol MedallasDomainMapper {
    func domainToPresentation(_ value: [Medalla]?) -> [UIMedalla]
    func presentationToDomain(_ value: [UIMedalla]?) -> [Medalla]
}

//
//  PerfilDomainMapperImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

final class PerfilDomainMapperImpl: PerfilDomainMapper {

    func domainToPresentation(_ values: [PerfilFuncionality]?) -> [UIPerfilFuncionality] {
        values?.map {
            UIPerfilFuncionality(
                name: $0.name,
                icon: $0.icon,
                type: $0.type
            )
        } ?? []
    }
}

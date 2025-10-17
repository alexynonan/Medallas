//
//  PerfilDomainMapper.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

import UIKit

protocol PerfilDomainMapper {
    func domainToPresentation(_ value: [PerfilFuncionality]?) -> [UIPerfilFuncionality]
}

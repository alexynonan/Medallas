//
//  PerfilRepository.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

import UIKit

protocol PerfilRepository {
    func fetchFuncionalidades() async -> ApiResult<[PerfilFuncionality]>
}

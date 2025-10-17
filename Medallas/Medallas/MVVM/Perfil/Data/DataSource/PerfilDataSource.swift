//
//  PerfilDataSource.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol PerfilDataSource {
    func fetchFuncionalidades() async -> ApiResult<[ApiPerfilFuncionality]>
}

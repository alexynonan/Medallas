//
//  FetchPerfilUseCase.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

protocol FetchPerfilUseCase {
    func fetchFuncionalidades() async -> ApiResult<[UIPerfilFuncionality]>
}

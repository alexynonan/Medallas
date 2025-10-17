//
//  UIPerfilFuncionality.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

struct UIPerfilFuncionality {

    let name: String
    let icon: String
    let type: Int
    
    func nameComplet() -> String {
        "\(icon) \(name)"
    }
}

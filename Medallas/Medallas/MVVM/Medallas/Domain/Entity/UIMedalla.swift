//
//  UIMedalla.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

struct UIMedalla {
    let name: String
    let iconName: String
    let typeMedalla: Int
    
    func nameComplet() -> String {
        "\(iconName) \(name)"
    }
}

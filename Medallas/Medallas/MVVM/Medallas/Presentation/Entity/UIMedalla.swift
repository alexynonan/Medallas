//
//  UIMedalla.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

struct UIMedalla {
    let id: String
    let name: String
    let description: String
    let icon: String
    let category: String
    let rarity: String
    let backgroundColor: String
    let progressColor: String
    var level: Int
    var points: Int
    let maxLevel: Int
    let reward: String
    let unlockedAt: String
    let nextLevelGoal: String
    let isLocked: Bool
    let animationType: String
    var showSuccessUpLevel: Bool
    
    func showIconSuccessfulMedal() -> String {
        let state = level == maxLevel
        return state ? "ic_medalla" : "ic_medallaOf"
    }
    
    func mostrarAnimacionConfenti() -> Bool {
        let state = level == maxLevel
        return !state && showSuccessUpLevel
    }
}

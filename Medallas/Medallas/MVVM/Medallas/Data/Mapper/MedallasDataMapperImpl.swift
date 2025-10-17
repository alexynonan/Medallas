//
//  MedallasDataMapperImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

final class MedallasDataMapperImpl: MedallasDataMapper {
    
    func dataToDomain(_ value: [ApiMedallas]?) -> [Medalla] {
        value?.map {
            Medalla(
                id: $0.id,
                name: $0.name,
                description: $0.description,
                icon: $0.icon,
                category: $0.category,
                rarity: $0.rarity,
                backgroundColor: $0.backgroundColor,
                progressColor: $0.progressColor,
                level: $0.level,
                points: $0.points,
                maxLevel: $0.maxLevel,
                reward: $0.reward,
                unlockedAt: $0.reward,
                nextLevelGoal: $0.nextLevelGoal,
                isLocked: $0.isLocked,
                animationType: $0.animationType
            )
        } ?? []
    }
    
    func dataToDomain(_ value: [CDMedallas]?,_ value2: [ApiMedallas]?) -> [Medalla] {
        guard let value2 = value2 else { return [] }
        
        let localDict = Dictionary(uniqueKeysWithValues: (value ?? []).map { ($0.id, $0) })

        return value2.map {
            if let local = localDict[$0.id] {
                return Medalla(
                    id: $0.id,
                    name: $0.name,
                    description: $0.description,
                    icon: $0.icon,
                    category: $0.category,
                    rarity: $0.rarity,
                    backgroundColor: $0.backgroundColor,
                    progressColor: $0.progressColor,
                    level: local.level,
                    points: local.points,
                    maxLevel: $0.maxLevel,
                    reward: $0.reward,
                    unlockedAt: $0.reward,
                    nextLevelGoal: $0.nextLevelGoal,
                    isLocked: $0.isLocked,
                    animationType: $0.animationType
                )
            } else {
                return Medalla(
                    id: $0.id,
                    name: $0.name,
                    description: $0.description,
                    icon: $0.icon,
                    category: $0.category,
                    rarity: $0.rarity,
                    backgroundColor: $0.backgroundColor,
                    progressColor: $0.progressColor,
                    level: 1,
                    points: .zero,
                    maxLevel: $0.maxLevel,
                    reward: $0.reward,
                    unlockedAt: $0.reward,
                    nextLevelGoal: $0.nextLevelGoal,
                    isLocked: $0.isLocked,
                    animationType: $0.animationType
                )
            }
        }
    }
}

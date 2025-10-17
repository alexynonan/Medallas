//
//  MedallasDomainMapperImpl.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 16/10/25.
//

final class MedallasDomainMapperImpl: MedallasDomainMapper {
    
    func domainToPresentation(_ value: [Medalla]?) -> [UIMedalla] {
        value?.map {
            UIMedalla(
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
                animationType: $0.animationType,
                showSuccessUpLevel: false
            )
        } ?? []
    }
    
    func presentationToDomain(_ value: [UIMedalla]?) -> [Medalla] {
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
}

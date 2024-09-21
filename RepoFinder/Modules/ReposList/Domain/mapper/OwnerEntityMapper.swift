//
//  OwnerEntityMapper.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

protocol OwnerEntityMappable {
    func asOwnerEntity() -> OwnerEntity
}

extension OwnerModel: OwnerEntityMappable {
    func asOwnerEntity() -> OwnerEntity {
        .init(ownerId: id ?? 0, login: login ?? "", avatar: avatarURL)
    }
}

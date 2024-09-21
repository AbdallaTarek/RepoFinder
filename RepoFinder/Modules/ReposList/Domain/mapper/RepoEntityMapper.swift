//
//  RepoEntityMapper.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

protocol RepoEntityMapper {
    func asRepoEntity(createdAt: String) -> ReposListEntity
}

extension ReposListModel: RepoEntityMapper {
    func asRepoEntity(createdAt: String) -> ReposListEntity {
        ReposListEntity(
            repoId: id ?? 0,
            name: name ?? "",
            fullName: fullName ?? "",
            owner: owner.asOwnerEntity(),
            htmlURL: htmlURL,
            description: description ?? "-",
            createdAt: createdAt
        )
    }
}


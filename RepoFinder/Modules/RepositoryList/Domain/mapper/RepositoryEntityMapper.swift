//
//  RepositoryEntityMapper.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

protocol RepositoryEntityMapper {
    func asRepoEntity(createdAt: String) -> RepositoryListEntity
}

extension RepositoryModel: RepositoryEntityMapper {
    func asRepoEntity(createdAt: String) -> RepositoryListEntity {
        RepositoryListEntity(
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


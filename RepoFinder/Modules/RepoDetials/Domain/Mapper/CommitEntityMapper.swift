//
//  CommitEntityMapper.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation

protocol CommitEntityMapper {
    func asCommitEntity(createdAt: String) -> CommitEntity
}

extension CommitModel: CommitEntityMapper {
    func asCommitEntity(createdAt: String) -> CommitEntity {
        .init(
            sha: sha ?? "",
            commit: commit?.asCommitDataEntity(createdAt: createdAt),
            htmlURL: htmlURL ?? ""
        )
    }
}

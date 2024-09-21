//
//  CommitDataMapper.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation
protocol CommitDataMapper {
    func asCommitDataEntity(createdAt: String) -> CommitDataEntity
}

extension CommitData: CommitDataMapper {
    func asCommitDataEntity(createdAt: String) -> CommitDataEntity {
        .init(
            committer: committer?.asCommitAuthorEntity(date: createdAt),
            message: message ?? "",
            url: url ?? "",
            commentCount: commentCount ?? 0
        )
    }
}

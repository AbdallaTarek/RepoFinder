//
//  CommitAuthorMapper.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation

protocol CommitAuthorMappable {
    func asCommitAuthorEntity(date: String) -> CommitAuthorEntity
}

extension CommitAuthor: CommitAuthorMappable {
    func asCommitAuthorEntity(date: String) -> CommitAuthorEntity {
        .init(
            name: name ?? "",
            email: email ?? "",
            date: date
        )
    }
}

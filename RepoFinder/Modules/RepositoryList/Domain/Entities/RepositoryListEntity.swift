//
//  RepositoryListEntity.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

struct RepositoryListEntity: Identifiable {
    let id = UUID()
    let repoId: Int
    let name: String
    let fullName: String
    let owner: OwnerEntity
    let htmlURL: URL?
    let description: String
    let createdAt: String

    static func dummyData(owner: OwnerEntity) -> Self {
        .init(
            repoId: 0,
            name: "Abdullah",
            fullName: "Abdullah Tarek",
            owner: owner,
            htmlURL: URL(string: "https://github.com"),
            description: "This is a sample description.",
            createdAt: "2024"
        )
    }
}

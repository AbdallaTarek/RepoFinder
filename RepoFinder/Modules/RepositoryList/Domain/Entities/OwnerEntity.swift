//
//  OwnerEntity.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

struct OwnerEntity: Identifiable {
    let id = UUID()
    let ownerId: Int
    let login: String
    let avatar: URL?

    static func dummyData() -> Self {
        .init(
            ownerId: 0,
            login: "Abdullah Take",
            avatar: URL(
                string: "https://avatars.githubusercontent.com/u/1?v=4"
            )
        )
    }
}

//
//  ReposListEntity.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

struct ReposListEntity: Identifiable {
    let id = UUID()
    let repoId: Int
    let name: String
    let fullName: String
    let owner: OwnerEntity
    let htmlURL: URL?
    let description: String
    let createdAt: String
}

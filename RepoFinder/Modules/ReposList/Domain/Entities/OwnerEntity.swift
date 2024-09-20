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
}

//
//  OwnerModel.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

struct OwnerModel: Codable {
    let id: Int?
    let login: String?
    let avatarURL: URL?

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
    }
}

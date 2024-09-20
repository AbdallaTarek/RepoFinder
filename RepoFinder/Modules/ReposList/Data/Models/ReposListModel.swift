//
//  ReposListModel.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

struct ReposListModel: Codable {
    let id: Int?
    let name: String?
    let fullName: String?
    let owner: OwnerModel
    let htmlURL: URL?
    let description: String?
    let createdAt: Date?

    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case description
        case createdAt = "created_at"
    }
}

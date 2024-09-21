//
//  CommitAuthor.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation

struct CommitAuthor: Codable {
    let name, email: String?
    let date: String?
    
    enum CodingKeys: CodingKey {
        case name
        case email
        case date
    }
}

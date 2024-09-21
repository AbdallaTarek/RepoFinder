//
//  CommitAuthor.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation

struct CommitAuthorEntity: Identifiable {
    var id = UUID()
    let name, email: String
    let date: String
}

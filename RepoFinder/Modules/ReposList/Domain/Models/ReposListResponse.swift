//
//  ReposResponse.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

// MARK: - ReposListResponse

struct ReposListResponse: Identifiable, Codable {
    let id: Int
    let name: String?
    let fullName: String?
    let owner: Owner
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

    func formattedRelativeDate() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        guard let createdAt = self.createdAt else {
            return "Date not available"
        }
        
        if let monthsDifference = calendar.dateComponents([.month], from: createdAt, to: now).month, monthsDifference < 6 {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMM dd, yyyy"
            return formatter.string(from: createdAt)
        } else {
            let components = calendar.dateComponents([.year, .month], from: createdAt, to: now)
            if let years = components.year, years > 0 {
                return "\(years) year\(years == 1 ? "" : "s") ago"
            } else if let months = components.month, months > 0 {
                return "\(months) month\(months == 1 ? "" : "s") ago"
            } else {
                return "Recently"
            }
        }
    }
}

// MARK: - Owner Model

struct Owner: Codable {
    let login: String
    let avatarURL: URL

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

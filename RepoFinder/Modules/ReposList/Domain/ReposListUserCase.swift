//
//  ReposListUserCase.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

protocol ReposListUserCaseInterface {
    func getGithubRepos() async throws -> [ReposListEntity]
}

final actor ReposListUserCase: ReposListUserCaseInterface {
    private let repository: ReposListRepositoryInterface

    public init(repository: ReposListRepositoryInterface) {
        self.repository = repository
    }

    func getGithubRepos() async throws -> [ReposListEntity] {
        return try await repository.fitchApiGithubRepos().map({
            $0.asRepoEntity(createdAt: formattedRelativeDate(createdAt: $0.createdAt))
        })
    }

    private func formattedRelativeDate(createdAt: Date?) -> String {
        let calendar = Calendar.current
        let now = Date()

        guard let createdAt = createdAt else {
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

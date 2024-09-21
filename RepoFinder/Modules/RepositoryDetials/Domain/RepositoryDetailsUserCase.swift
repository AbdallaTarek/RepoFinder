//
//  RepositoryDetailsUserCase.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

protocol RepositoryDetailsUserCaseInterface: AnyObject {
    func getRepositoryCommits() async throws -> [CommitEntity]
}

final actor RepositoryDetailsUserCase: RepositoryDetailsUserCaseInterface {
    var fullName: String

    private let repository: RepositoryDetailsRepositoryInterface

    init(repository: RepositoryDetailsRepositoryInterface, fullName: String) {
        self.repository = repository
        self.fullName = fullName
    }

    func getRepositoryCommits() async throws -> [CommitEntity] {
        return try await repository.fitchRepositoryCommits(fullName: fullName).map({
            $0.asCommitEntity(createdAt: formattedRelativeDate(createdAt: $0.commit?.committer?.date?.toDate()))
        })
    }

    private func formattedRelativeDate(createdAt: Date?) -> String {
        let calendar = Calendar.current
        let now = Date()

        guard let createdAt = createdAt else {
            return formattedRelativeDate(createdAt: .randomDate())
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

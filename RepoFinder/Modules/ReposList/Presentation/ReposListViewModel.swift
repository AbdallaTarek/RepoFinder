//
//  ReposListViewModel.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

protocol ReposListViewModelInterface: AnyObject {
    func fetchReposList()
    func getReposListCount() async throws -> Int
}

class ReposListViewModel: ObservableObject {
    @Published var reposListDataSource: [ReposListResponse]?

    let useCase: ReposListUserCaseInterface
    
    init(useCase: ReposListUserCaseInterface) {
        self.useCase = useCase
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            Task {
                await self.fetchReposList()
            }
        }
    }
    
    func fetchReposList() async {
        do {
            reposListDataSource = try await useCase.getGithubRepos()
        } catch {
            
        }
    }
}

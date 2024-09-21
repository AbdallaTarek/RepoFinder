//
//  RepositoryListFactoryContainer.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import SwiftUI
import URLSessionHTTPClient

struct RepositoryListFactoryContainer {
    static func service() -> RepositoryListServiceInterface {
        let client = URLSessionHTTPClient()
        return RepositoryListService(client: client)
    }

    static func repository() -> RepositoryListRepositoryInterface {
        return RepositoryListRepository(service: Self.service())
    }

    static func useCase() -> RepositoryListUserCaseInterface {
        let repository = Self.repository()
        return RepositoryListUserCase(repository: repository)
    }

    @MainActor static func viewModel() -> RepositoryListViewModel {
        let useCase = Self.useCase()
        return RepositoryListViewModel(useCase: useCase)
    }

    @MainActor static func view() -> AnyView {
        let viewModel = Self.viewModel()
        return AnyView(ReposListView(viewModel: viewModel))
    }
}

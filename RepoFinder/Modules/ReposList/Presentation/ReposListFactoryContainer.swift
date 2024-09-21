//
//  ReposListFactoryContainer.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import SwiftUI
import URLSessionHTTPClient

struct ReposListFactoryContainer {
    static func service() -> ReposListServiceInterface {
        let client = URLSessionHTTPClient()
        return ReposListService(client: client)
    }

    static func repository() -> ReposListRepositoryInterface {
        return ReposListRepository(service: Self.service())
    }

    static func useCase() -> ReposListUserCaseInterface {
        let repository = Self.repository()
        return ReposListUserCase(repository: repository)
    }

    @MainActor static func viewModel() -> ReposListViewModel {
        let useCase = Self.useCase()
        return ReposListViewModel(useCase: useCase)
    }

    @MainActor static func view() -> AnyView {
        let viewModel = Self.viewModel()
        return AnyView(ReposListView(viewModel: viewModel))
    }
}

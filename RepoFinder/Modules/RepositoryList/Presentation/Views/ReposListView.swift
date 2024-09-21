//
//  ReposListView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import SwiftUI

struct ReposListView<ViewModel: RepositoryListViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(viewModel.reposListDataSource) { repo in
                NavigationLink(
                    destination: RepositoryDetailsFactoryContainer.view(repositoryData: repo),
                    label: {
                        RepositoryItemView(
                            repo: repo
                        )
                    })
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Github Repositories"))
            .onAppear {
                viewModel.fetchReposList()
            }
        }
    }
}


#Preview {
    RepositoryListFactoryContainer.view()
}

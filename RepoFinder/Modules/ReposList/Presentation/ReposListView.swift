//
//  ReposListView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import SwiftUI

struct ReposListView<ViewModel: ReposListViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(viewModel.reposListDataSource) { repo in
                NavigationLink(destination: RepositoryDetailsView(repositoryData: repo), label: { RepoItemView(repo: repo) })
            }
            .navigationTitle(Text("Github Repositories"))
            .onAppear {
                viewModel.fetchReposList()
            }
        }
    }
}


#Preview {
    ReposListFactoryContainer.view()
}

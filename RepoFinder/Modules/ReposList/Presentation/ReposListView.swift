//
//  ReposListView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import SwiftUI

struct ReposListView: View {
    @ObservedObject var viewModel = ReposListViewModel(useCase: ReposListUserCase())

    @State var s = false

    var body: some View {
        NavigationView {
            if s {
                RepositoryDetailView(repository: viewModel.reposListDataSource![0])
                    .navigationBarTitle(Text("Github Repositories"))

            } else {
                List(viewModel.reposListDataSource ?? []) { repo in
                    RepoItemView(repo: repo)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {                    
                        s = true
                    }
                }
            }
        }
    }
}

import SwiftUI

struct RepositoryDetailView: View {
    let repository: ReposListResponse

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Repository Title and Owner Information
                Text(repository.fullName ?? "")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                HStack {
                    RemoteImage(url: repository.owner.avatarURL)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Owner: \(repository.owner.login)")
                            .font(.headline)
                        Link("View on GitHub", destination: repository.htmlURL!)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }

                Divider()

                // Repository Description
                if let description = repository.description {
                    Text(description)
                        .font(.body)
                        .padding(.bottom, 10)
                }

                // Repository Stats (Stars, Forks, Issues)
                HStack {
                    VStack {
                        Text("★")
                            .font(.largeTitle)
                            .padding(.bottom, 5)
                        Text("Stars")
                            .font(.subheadline)
                        Text("1.5k") // Dummy value
                            .font(.headline)
                    }
                    Spacer()
                    VStack {
                        Text("🍴")
                            .font(.largeTitle)
                            .padding(.bottom, 5)
                        Text("Forks")
                            .font(.subheadline)
                        Text("300") // Dummy value
                            .font(.headline)
                    }
                    Spacer()
                    VStack {
                        Text("🐛")
                            .font(.largeTitle)
                            .padding(.bottom, 5)
                        Text("Issues")
                            .font(.subheadline)
                        Text("42") // Dummy value
                            .font(.headline)
                    }
                }
                .padding(.vertical)

                Divider()

                // Created Date
                Text("Created on \(repository.formattedRelativeDate())")
                    .font(.footnote)
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(repository.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ReposListView()
}

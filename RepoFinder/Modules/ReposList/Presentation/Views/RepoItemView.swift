//
//  RepoItemView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import SwiftUI

struct RepoItemView: View {
    let repo: ReposListEntity

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: repo.owner.avatar, content: { image in
                image
                    .resizable()
                    .scaledToFill()

            }, placeholder: { ProgressView() })
                .frame(width: 60, height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 4) {
                Text(repo.name)
                    .font(.headline)

                Text("Owner: \(repo.owner.login)")
                    .font(.subheadline)

                Text("Created on \(repo.createdAt)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(content: {
            Color.viewBackground
        })
    }
}

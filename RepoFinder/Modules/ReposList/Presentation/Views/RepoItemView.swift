//
//  RepoItemView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import SwiftUI

struct RepoItemView: View {
    
    let repo: ReposListResponse
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            RemoteImage(url: repo.owner.avatarURL)
                .frame(width: 60, height: 80)
                .scaledToFill()
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 4) {
                Text(repo.name ?? "")
                    .font(.headline)

                Text("Owner: \(repo.owner.login)")
                    .font(.subheadline)

                Text("Created \(repo.formattedRelativeDate())")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

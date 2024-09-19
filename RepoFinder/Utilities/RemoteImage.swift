//
//  RemoteImage.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//


import SwiftUI
import Combine

struct RemoteImage: View {
    let url: URL
    @StateObject private var imageLoader = ImageLoader()

    var body: some View {
        ZStack {
            if let image = imageLoader.image {
                Image(uiImage: imageLoader.image ?? UIImage(systemName: "person.fill")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }else{
                ProgressView()
            }
        }
        .onAppear {
            imageLoader.loadImage(from: url)
        }
        .onDisappear {
            imageLoader.cancel()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?

    func loadImage(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }

    func cancel() {
        cancellable?.cancel()
    }
}

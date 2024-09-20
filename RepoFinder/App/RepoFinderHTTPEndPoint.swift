//
//  RepoFinderHTTPEndPoint.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation
import HTTPClient

protocol RepoFinderHTTPEndPoint: HTTPEndPoint {
    var path: String { get }
}

extension RepoFinderHTTPEndPoint {
    var url: String { "https://api.github.com/\(path)" }
}

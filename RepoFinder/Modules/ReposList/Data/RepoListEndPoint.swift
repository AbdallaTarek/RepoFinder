//
//  RepoListEndPoint.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import HTTPClient
import Foundation

struct RepoListEndPoint: RepoFinderHTTPEndPoint {
    var timeInterval: TimeInterval = 60
    var task: HTTPEndPointTask = .plain
    var headers: Headers? = nil
    var method: HTTPMethod { .get }
    var path: String = "repositories"
}

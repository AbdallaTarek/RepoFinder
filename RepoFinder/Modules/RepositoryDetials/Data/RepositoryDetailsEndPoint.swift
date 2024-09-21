//
//  RepositoryDetailsEndPoint.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation
import HTTPClient

class RepositoryDetailsEndPoint: RepoFinderHTTPEndPoint {
    var fullName: String = ""
    var timeInterval: TimeInterval = 60
    var task: HTTPEndPointTask = .plain
    var headers: Headers? = nil
    var method: HTTPMethod { .get }
    var path: String
    
    init(fullName: String) {
        self.fullName = fullName
        self.path = "repos/\(fullName)/commits"
    }
}

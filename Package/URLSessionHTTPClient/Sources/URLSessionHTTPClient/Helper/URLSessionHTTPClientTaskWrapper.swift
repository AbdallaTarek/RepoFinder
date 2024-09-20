//
//  URLSessionHTTPClientTaskWrapper.swift
//
//
//  Created by Abdullah Tarek on 22/08/2024.
//

import Foundation
import HTTPClient

public struct URLSessionHTTPClientTaskWrapper: HTTPClientTask {
    let wrapped: URLSessionTask

    public func cancel() {
        wrapped.cancel()
    }
}

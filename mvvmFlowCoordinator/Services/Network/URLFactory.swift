//
//  URLFactory.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/14/22.
//

import Foundation

struct URLFactory {
    static func getBreedsRequest(params: BreedURLParameters) -> URLRequest {
        let url = URL(string: API.baseURL)!
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        urlComponents!.queryItems = []
        
        let queryItems = [
            URLQueryItem(name: "page", value: String(params.page)),
            URLQueryItem(name: "limit", value: String(params.limit))
        ]
        
        urlComponents?.queryItems?.append(contentsOf: queryItems)
        
        var request = URLRequest(url: (urlComponents?.url!.appendingPathComponent(API.Typeof.breeds))!)
        request.setValue(API.apiKey, forHTTPHeaderField: API.headerKey)
        
        return request
    }
}

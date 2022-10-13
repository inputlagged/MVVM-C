//
//  Post.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/11/22.
//

import Foundation

struct ResponseInfo: Decodable {
    let next: URL
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let height: String
    let mass: String
    let gender: String
}

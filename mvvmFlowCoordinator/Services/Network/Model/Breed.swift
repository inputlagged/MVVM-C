//
//  Post.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/11/22.
//

import Foundation
import ObjectMapper

struct Breed: Mappable {
    var name: String?
    var origin: String?
    var image: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name   <- map["name"]
        origin <- map["origin"]
        image  <- map["image.url"]
    }
}

struct BreedURLParameters {
    var page: Int
    var limit: Int
}

//
//  API.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/14/22.
//

import Foundation

internal enum API {
    static let baseURL = "https://api.thecatapi.com/v1"
    static let apiKey = "live_pMqNhBahDYhbszaMHiyQAowxm9Pr32fgeAZ3CKdNxBfnQ740TuqPWGsB5vNS4fjc"
    static let headerKey = "x-api-key"
    
    enum Typeof {
        static let breeds = "/breeds"
    }
}



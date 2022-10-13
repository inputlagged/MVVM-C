//
//  Assembly.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/13/22.
//

import Foundation
import Swinject

internal final class Assembly {
    
    internal var container: Container
    
    internal init(container: Container) {
        self.container = container
        configureApplicationDependecies()
    }
    
    private func configureApplicationDependecies() {
        container.register(NetworkService.self) { _ in
            NetworkService()
        }.inObjectScope(.container)
        
       
    }
}

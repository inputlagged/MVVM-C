//
//  CharacterDetailViewModel.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/13/22.
//

import Foundation

protocol CatDetailViewModelProtocol {
    var breed: Breed { get set }
}

internal final class CatDetailViewModel: CatDetailViewModelProtocol {
    internal var breed: Breed
    
    internal init(breed: Breed) {
        self.breed = breed
    }
}

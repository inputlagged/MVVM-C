//
//  CharacterDetailViewModel.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/13/22.
//

import Foundation

protocol CharacterDetailViewModelProtocol {
    var character: Character { get set }
}

internal final class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    internal var character: Character
    
    internal init(character: Character) {
        self.character = character
    }
}

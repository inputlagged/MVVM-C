//
//  FirstViewModel.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/11/22.
//

import Foundation

protocol MainViewModelProtocol {
    var title: String { get set }
    var reload: (() -> ())? { get set }
    
    var characters: [Character] { get set }
    func fetchCharacters()
    func viewModelForSelectedRow(at indexPath: IndexPath) 
}

internal final class MainViewModel: MainViewModelProtocol {
    
    internal var characters: [Character] = []
    internal var reload: (() -> ())?
    internal weak var coordinator: DetailScreen!
    
    private let networkService: NetworkServiceProtocol
    private var currentPage = 1
    
    internal var title = S.title
    
    internal init(networkService: NetworkService, coordinator: DetailScreen) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    
    internal func fetchCharacters() {
        networkService.fetchCharacters(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.characters.append(contentsOf: response.results)
                self.reload?()
                self.currentPage += 1
            case .failure(let error):
                print("Something went wrong")
            }
        }
    }
    
    internal func viewModelForSelectedRow(at indexPath: IndexPath) {
        
        coordinator.presentDetailScreen(character: characters[indexPath.row])
    }
}

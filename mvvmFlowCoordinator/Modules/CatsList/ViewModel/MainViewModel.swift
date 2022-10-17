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
    var breeds: [Breed] { get set }
    
    func fetchBreeds()
    func viewModelForSelectedRow(at indexPath: IndexPath)
}

internal final class MainViewModel: MainViewModelProtocol {
    
    internal var breeds: [Breed] = []
    internal var reload: (() -> ())?
    internal weak var coordinator: DetailScreen!
    
    private let networkService: NetworkServiceProtocol
    private var URLParamters = BreedURLParameters(page: 1, limit: 20)
    
    internal var title = S.title
    
    internal init(networkService: NetworkService, coordinator: DetailScreen) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    
    internal func fetchBreeds() {
        networkService.fetchBreeds(params: URLParamters) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.breeds.append(contentsOf: response)
                self.reload?()
                self.URLParamters.page += 1
            case .failure(let error):
                print("Something went wrong")
            }
        }
    }
    
    internal func viewModelForSelectedRow(at indexPath: IndexPath) {
        coordinator.presentDetailScreen(breed: breeds[indexPath.row])
    }
}

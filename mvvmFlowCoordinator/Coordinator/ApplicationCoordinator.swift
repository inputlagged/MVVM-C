import UIKit
import Swinject

protocol DetailScreen: AnyObject {
    func presentDetailScreen(breed: Breed)
}

internal final class ApplicationCoordinator: Coordinator, DetailScreen {
    internal var parentCoordinator: Coordinator?
    internal var childCoordinators: [Coordinator] = []
    internal var navigationController: UINavigationController
    
    internal var container: Container
    internal var assembly: Assembly
    
    internal init(navigationController: UINavigationController, assembly: Assembly, container: Container) {
        self.container = container
        self.assembly = assembly
        self.navigationController = navigationController
    }
    
    internal func start() {
        navigateToCatList()
    }
    
    internal func navigateToCatList() {
        let networkService = assembly.container.resolve(NetworkService.self)
        let viewModel = CatListViewModel(networkService: networkService!, coordinator: self)
        let mainViewController = CatListViewController()
        mainViewController.viewModel = viewModel
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    internal func presentDetailScreen(breed: Breed) {
        let viewModel = CatDetailViewModel(breed: breed)
        let detailViewController = CatDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

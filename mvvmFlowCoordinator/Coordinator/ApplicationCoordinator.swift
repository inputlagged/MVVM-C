import UIKit
import Swinject

protocol DetailScreen: AnyObject {
    func presentDetailScreen(character: Character)
}

internal final class ApplicationCoordinator: Coordinator, DetailScreen {
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
        let networkService = assembly.container.resolve(NetworkService.self)
        let viewModel = MainViewModel(networkService: networkService!, coordinator: self)
        let mainViewController = MainViewController()
        mainViewController.viewModel = viewModel
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    internal func presentDetailScreen(character: Character) {
        let viewModel = CharacterDetailViewModel(character: character)
        let detailViewController = CharacterDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    internal func childDidFinish(_ child: Coordinator?) {
        for (index, value) in childCoordinators.enumerated() {
            if value === child {
                childCoordinators.remove(at: index)
                return
            }
        }
    }
}

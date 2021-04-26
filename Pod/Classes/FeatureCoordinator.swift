import UIKit

open class FeatureCoordinator {

    //MARK: -Properties
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []
    
    // MARK: - Constructurs
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}


extension FeatureCoordinator: Coordinator {
    public func start() {
        childCoordinators.removeAll()
        let sceneCoordinator = SceneCoordinator(
            navigationController: navigationController,
            delegate: self
        )
        childCoordinators.append(sceneCoordinator)
        sceneCoordinator.start()
    }
}


extension FeatureCoordinator: SceneCoordinatorDelegate {
    public func goToError(coordinator: SceneCoordinator) {
        childCoordinators.removeAll()
        let errorCoordinator = ErrorCoordinator(
            navigationController: navigationController,
            delegate: self
        )
        childCoordinators.append(sceneCoordinator)
        sceneCoordinator.start()
    }
}

extension FeatureCoordinator: ErrorCoordinatorDelegate {
    public func goBack(coordinator: ErrorCoordinator) {
        navigationController.popToRootViewController(animated: true)
    }
}

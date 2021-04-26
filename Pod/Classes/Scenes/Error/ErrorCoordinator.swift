import UIKit

protocol ErrorCoordinatorDelegate: class {
    func goBack(coordinator: ErrorCoordinator)
}


class ErrorCoordinator {

    // MARK: - Properties
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []
    private weak var delegate: ErrorCoordinatorDelegate?

        // MARK: - Constructurs
    public init(navigationController: UINavigationController, delegate: ErrorCoordinatorDelegate? = nil) {
        self.navigationController = navigationController
        self.delegate = delegate
    }
}

// MARK: - Start point
extension ErrorCoordinator: Coordinator {
    public func start() {
        // MARK: - call the ErrorViewController
    }
}
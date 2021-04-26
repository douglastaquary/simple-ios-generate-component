import UIKit

protocol SceneCoordinatorDelegate: class {
    func goToError(coordinator: SceneCoordinator)
}


class SceneCoordinator {

    // MARK: - Properties
    public var navigationController: UINavigationController
    public var childCoordinators: [Coordinator] = []
    private weak var delegate: SceneCoordinatorDelegate?

        // MARK: - Constructurs
    public init(navigationController: UINavigationController, delegate: SceneCoordinatorDelegate? = nil) {
        self.navigationController = navigationController
        self.delegate = delegate
    }
}

// MARK: - Start point
extension SceneCoordinator: Coordinator {
    public func start() {
        let service = FeatureService()
        let viewModel = FeatureViewModel(service: service, delegate: self)
        let view = FeatureViewController(viewModel: viewModel)

        navigationController.pushViewController(view, animated: true)
    }
}

extension SceneCoordinator: FeatureViewModelDelegate {
    public func goToNextFeature(viewModel: FeatureViewModel) {
        delegate?.goToError(coordinator: self)
    }
}
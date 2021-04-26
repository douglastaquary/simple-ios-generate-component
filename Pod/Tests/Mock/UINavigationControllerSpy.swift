import UIKit

class UINavigationControllerSpy: UINavigationController {

    // MARK: - Spy
    var pushViewControllerCalled = false
    var presentCalled = false
    var popToRootViewControllerCalled = false
    var viewController: UIViewController?
    var animated: Bool?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.pushViewControllerCalled = true
        self.viewController = viewController
        self.animated = animated
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentCalled = true
        self.viewController = viewControllerToPresent
        self.animated = flag
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        self.popToRootViewControllerCalled = true
        self.animated = animated
        return super.popToRootViewController(animated: animated)
    }
}
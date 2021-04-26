import XCTest

@testable import ${POD_NAME}

class SceneCoordinatorTests: XCTestCase {

    // MARK: Subject Under Test
    var coordinator: SceneCoordinator!
    var delegateSpy: SceneCoordinatorDelegateMock!
    var navigationControllerSpy: UINavigationControllerSpy!


    // MARK: - Tests LifeCycle
    override func setUp() {
        super.setUp()
        navigationControllerSpy = .init()
        delegateSpy = .init()
        coordinator = .init(navigationController: navigationControllerSpy, delegate: delegateSpy)
    }
    
    // MARK: Tests
    func testStart() {
        // When
        coordinator.start()

        //Then
        XCAssert(navigationControllerSpy.pushViewControllerCalled,
                 "start() should push to navigation controller")
        XCAssert(navigationControllerSpy.viewController is FeatureViewController,
                 "start() should push to feature view controller")
    }

    func testGoToNextFeature() {
        // Given
        let fakeViewModel = FeatureViewModel(service: FeatureService())
        let previousCount = coordinator.childCoordinators.count

        // When
        coordinator.goToNextFeature(viewModel: fakeViewModel)

        //Then
        XCAssertGreaterThan(delegateSpy.goToErrorCalled, 
                            "scene coordinator should call flow coordinator")
    }

}
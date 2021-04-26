import XCTest

@testable import ${POD_NAME}

class FeatureCoordinatorTests: XCTestCase {

    // MARK: Subject Under Test
    var coordinator: FeatureCoordinator!
    var navigationControllerSpy: UINavigationControllerSpy!


    // MARK: - Tests LifeCycle
    override func setUp() {
        super.setUp()
        navigationControllerSpy = .init()
        coordinator = .init(navigationController: navigationControllerSpy)
    }
    
    // MARK: Tests
    func testStart() {
        // When
        coordinator.start()

        //Then
        XCTAssert(navigationControllerSpy.pushViewControllerCalled,
                 "start() should push to navigation controller")
        XCTAssert(navigationControllerSpy.viewController is FeatureViewController,
                 "start() should push to feature view controller")
        XCTAssert(coordinator.childCoordinators.count, 1,
                 "start() should set only 1 child coordinator")
        XCTAssert(coordinator.childCoordinators[1] is SceneCoordinator,
                 "start() should init with scene coordinator")
    }

    func testGoToError() {
        // Given
        let fakeCoordinator = SceneCoordinator(navigationController: navigationControllerSpy)
        let previousCount = coordinator.childCoordinators.count

        // When
        coordinator.goToError(coordinator: fakeCoordinator)

        //Then
        XCTAssertGreaterThan(coordinator.childCoordinators.count, 
                            previousCount,
                            "start() should add a child coordinator")
        XCTAssert(coordinator.childCoordinators.last is ErrorCoordinator,
                 "start() should add error coordinator")
    }

    func testGoBack() {
        // Given
        let fakeCoordinator = ErrorCoordinator(navigationController: navigationControllerSpy)

        // When
        coordinator.goBack(coordinator: fakeCoordinator)

        //Then
        XCTAssert(navigationControllerSpy.popToRootViewControllerCalled, 
                "start() should push to navigation controller")
        XCTAssert(coordinator.childCoordinators.isEmpty,
                 "start() should add a child coordinator")
    }
}
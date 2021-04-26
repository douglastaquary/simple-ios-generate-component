import XCTest

@testable import ${POD_NAME}

class ErrorCoordinatorTests: XCTestCase {

    // MARK: Subject Under Test
    var coordinator: ErrorCoordinator!
    var delegateSpy: ErrorCoordinatorDelegateSpy!
    var navigationControllerSpy: UINavigationControllerSpy!


    // MARK: - Tests LifeCycle
    override func setUp() {
        super.setUp()
        navigationControllerSpy = .init()
        delegateSpy = .init()
        coordinator = .init(navigationController: navigationControllerSpy, delegate: delegateSpy)
    }
    

    // MARK: Tests
    func testStart(){}
}
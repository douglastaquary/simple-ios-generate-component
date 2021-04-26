import Foundation
@testable import ${POD_NAME}

class SceneCoordinatorDelegateMock: SceneCoordinatorDelegate {

    // MARK: Properties
     var goToErrorCalled = false

     // MARK: - Implementation
     func goToError(coordinator: SceneCoordinator) {
         goToErrorCalled = true
     }

}


class ErrorCoordinatorDelegateSpy: ErrorCoordinatorDelegate {

    // MARK: Properties
     var goToBackCalled = false

     // MARK: - Implementation
     func goBack(coordinator: ErrorCoordinator) {
         goToBackCalled = true
     }

}
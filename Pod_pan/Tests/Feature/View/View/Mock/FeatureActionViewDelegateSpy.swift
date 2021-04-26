import Foundation
@testable import ${POD_NAME}

class FeatureActionViewDelegateSpy: FeatureActionViewDelegate {

    // MARK: - Properties
    var didTapSimuleteCalled = false
    var didTapContinueCalled = false

    // MARK: -Implementation
    func didTapSimulate(view: FeatureActionView) {
        didTapSimuleteCalled = true
    }

    func didTapContinue(view: FeatureActionView) {
        didTapContinueCalled = true
    }
}
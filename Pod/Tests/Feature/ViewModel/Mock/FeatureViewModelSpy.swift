import XCTest
@testable import ${POD_NAME}

class FeatureViewModelSpy: FeatureViewModelProtocol {

    // MARK: Spy
    var loadValueCalled = false
    var simulateCalled = false
    var nextCalled = false
    var simulateValue: NSNumber?

    // MARK: - Properties
    var state: Bindable<FeatureViewModelState?> = Bindable(nil)

    // MARK: - Tests
    func loadValue() {
        loadValueCalled = true 
    }

    func simulate(with value: NSNumber?) {
        simulateCalled = true 
        simulateValue = value

    }

    func next() {
        nextCalled = true 
    }
}

class FeatureViewModelDelegateSpy: FeatureViewModelDelegate {

    // MARK: Spy
    var goToNextFeatureCalled = false

    // MARK: - implementation
    func goToNextFeature(viewModel: FeatureViewModel) {
        goToNextFeatureCalled = true
    }
}
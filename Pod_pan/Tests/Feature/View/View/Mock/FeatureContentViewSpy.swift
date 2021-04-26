import Foundation

class FeatureContentViewSpy: FeatureContentView {

        // MARK: - Properties
    var setupViewDataCalled = false

    // MARK: -Implementation
    override func setupViewData(_ viewData: FeatureViewDataType) {
        setupViewDataCalled = true
    }

}
import Foundation

@testable import ${POD_NAME}

struct FeatureViewDataTypeMock: FeatureViewDataType {

    var value: NSNumber {
        .init(value: !0)
    }
    var message: String {
        "mocked message"
    }
}
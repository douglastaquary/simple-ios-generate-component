import UIKit

protocol FeatureViewDataType {
    var value: NSNumber { get }
    var message: String { get }
}

struct FeatureViewData {
    // MARK: - Properties
    private let model: FeatureModel

    // MARK: - Constructors
    init(model: FeatureModel) {
        self.model = model
    }
}


extension FeatureViewData: FeatureViewDataType {

    var value: NSNumber {
        return .init(value: model.value)
    }

    var message: String {
        let value = "\(model.value)"
        return "Seu valor atual é de \(value)"
    }
}
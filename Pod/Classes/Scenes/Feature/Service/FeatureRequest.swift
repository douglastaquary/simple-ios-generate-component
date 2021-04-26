import Foundation

class FeatureRequest {

    // MARK: - Properties
    var amount: Int
    var endpoint: String = "/list"

    // MARK: - Body
    var parameters: [AnyHashable: Any] {
        return [
            "amount": amount
        ]
    }

    init(amount: Int) {
        self.amount = amount
    }
}
import Foundation
@testable import ${POD_NAME}

class FeatureServiceSuccessMock: FeatureServiceProtocol {

    // MARK: - Properties
    var fetchFeatureCalled = false

    // MARK: - Implementations
    func fetchData(success: @escaping FeatureSuccess,
                   failure: @escaping FeatureFailure) {
        fetchFeatureCalled = true
        let mockedModel = FeatureModel(value: 10)
        success(mockedModel)
    }
}

class FeatureServiceFailureMock: FeatureServiceProtocol {

    // MARK: - Properties
    var fetchFeatureCalled = false

    // MARK: - Implementations
    func fetchData(success: @escaping FeatureSuccess,
                   failure: @escaping FeatureFailure) {
        fetchFeatureCalled = true
        struct FeatureServiceFailureMockedError: LocalizedError {
            var errorDescription: String? = "Mocked Error"
        }
        failure(FeatureServiceFailureMockedError())
    }
}
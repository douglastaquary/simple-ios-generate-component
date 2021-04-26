import Foundation

protocol FeatureServiceProtocol {
    
    typealias FetchSuccess = ((FeatureModel) -> Void)
    typealias FetchFailure = ((Error) -> Void)
    
    func fetchData(success: @escaping FetchSuccess, failure: @escaping FetchSuccess)
    
}

class ClientAPI {
    init(){}
}


class FeatureService {
    var client = ClientAPI()
}

extension FeatureService: FeatureServiceProtocol {
    func fetchData(success: @escaping FetchSuccess, failure: @escaping FetchSuccess) {
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { _ in
            let fakeResponse = FeatureModel(value: .random(in: 0<..200))
            success(fakeResponse)
        }
    }
}

struct InvalidResponseError: LocalizedError {
    var errorDescription: String? = "Invalid response"
}
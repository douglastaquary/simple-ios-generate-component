import Foundation

enum FeatureViewModelState {
    case loading(Bool)
    case data(FeatureViewDataType)
}


protocol FeatureViewModelProtocol: class {

    var state: Bindable<FeatureViewModelState?> { get }

    func loadValue()
    func simulate(with value: NSNumber?)
    func next()
}

protocol FeatureViewModelDelegate: class {
    func goToNextFeature(viewModel: FeatureViewModel)
}


class FeatureViewModel {

    // MARK: - Public Properties
    var state: Bindable<FeatureViewModelState?> = Bindable(nil)

    // MARK: - Private properties
    var service: FeatureServiceProtocol
    weak var delegate: FeatureViewModelDelegate?
    var model: FeatureModel? {
        didSet {
            guard let model = model else { return }
            state.value = .data(FeatureViewData(model: model))
        }
    }

    // MARK: - Constructors
    init(service: FeatureServiceProtocol, delegate: FeatureViewModelDelegate? = nil) {
        self.service = service
        self.delegate = delegate
    }

    //MARK: Private functions
    func check(value: Double) -> Bool {
        return value > 100
    }
}


extension FeatureViewModel: FeatureViewModelProtocol {
    func loadValue() {
        state.value = .loading(true)
        service.fetchData(success: { [weak self] model in 
            var model = model
            model.success = self?.check(value: model.value)
            self?.model = model
            self?.state.value = .loading(false)
        }, failure: { [weak self] _ in 
            self?.state.value = .loading(false)
        })
    }

    func simulate(with value: NSNumber?) {
        let doubleValue = value?.doubleValue ?? 0
        model = .init(value: doubleValue, success: check(value: doubleValue))
    }

    func next() {
        delegate?.goToNextFeature(viewModel: self)
    }
}


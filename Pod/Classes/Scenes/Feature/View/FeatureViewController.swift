import UIKit

class FeatureViewController: UIViewController {

    // MARK: - Views
    private var featureView: FeatureView?

    // MARK: - Properties
    private let viewModel: FeatureViewModelProtocol

    // MARK: - Constructors
    init(viewModel: FeatureViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Feature"
        bindViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func loadView() {
        featureView = FeatureView(delegate: self)
        self.view = featureView
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        viewModel.loadValue()
    }
}

extension FeatureViewController {
    func bindViewModel() {
        viewModel.state.bind {
            guard let state = $0 else { return }
            switch state {
                case .loading(let isLoading):
                    self.showLoading(isLoading)
                case .data(let viewData):
                    self.featureView?.setupViewData(viewData)
            }
        }
    }

    func showLoading(_ isLoading: Bool) {
        if isLoading {
            featureView?.contentView.activityIndicatorView.startAnimating()
            return
        }
        featureView?.contentView.activityIndicatorView.stopAnimating()
    }
}

// MARK: - Delegates implementations
extension FeatureViewController: FeatureActionViewDelegate {
    func didTapSimulate(view: FeatureActionView) {
        let value = Double.random(in: 0...10000) as NSNumber
        viewModel.simulate(with: value)
    }
    func didTapContinue(view: FeatureActionView) {
        viewModel.next()
    }
}
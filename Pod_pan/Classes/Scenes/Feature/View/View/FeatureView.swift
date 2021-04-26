import UIKit

class FeatureView: UIView {

    // MARK: - Custom Views
    private lazy var rootView: UIStackView = {
        let root = UIStackView(arrangedSubviews: [contentView, actionView])
        root.axis = .vertical
        root.aligment = .fill
        root.distribution = .equalSpacing
        root.spacing = 16
        root.layoutMargins = UIEdgeInsets(
            top: 16,
            left: 0,
            bottom: 16,
            right: 0
        )
        root.isLayoutMarginsRelativeArrangement = true
        return root
    }()

    lazy var contentView: FeatureContentView = {
        let view = FeatureContentView()
        return view
    }()

    lazy var actionView: FeatureActionView = {
        let view = FeatureActionView()
        return view
    }()

    //MARK: - Properties
    private weak var delegate: FeatureActionViewDelegate?

    // MARK: - Initializers
    convenience init(delegate: FeatureActionViewDelegate? = nil) {
        self.init(frame: .zero)
        self.delegate = delegate
        setupViewCode()
    }

    // MARK: - Setters
    func setupViewData(_ viewData: FeatureViewDataType) {
        contentView.setupViewData(viewData)
    }
}


extension FeatureView: ViewCodedProtocol {
    func addViews() {
        addSubview(rootView)
    }

    func addConstraints() {
        rootView.bindEdgesToSuperview()
        var constraints: [NSLayoutConstrait] = []
        if #available(iOS 11.0, *) {
            constraints.append(rootView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1))
            constraints.append(rootView.heightAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0))
        } else {
            constraints.append(rootView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1))
            constraints.append(rootView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0))
        }
        addConstraints(constraints)
    }   

    func setupViews() {
        backgroundColor = .white
        let tapSelector = #selector(endEditing(_:))
        let tapGesture = UITapGestureRecognizer(target: self, action: tapSelector)
        tapSelector.cancelsTouchesInView = false
        addGestureRecognizer(tapSelector)
    }
}
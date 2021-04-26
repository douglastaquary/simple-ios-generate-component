import Foundation

protocol FeatureActionViewDelegate: class {
    func didTapSimulate(view: FeatureActionView)
    func didTapContinue(view: FeatureActionView)
}

class FeatureActionView: UIStackView {

    // MARK: - Views
    lazy fileprivate var simulateButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Simular", for: .normal)
        button.setTitleColor(.azulLink, for: .normal)
        button.addTarget(self, action: #selector(simulateTap), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.layer.borderColor = UIColor.azulLink.cgColor
        return button
    }()

    // MARK: - Properties
    private weak var delegate: FeatureActionViewDelegate?

    // MARK: - Initializers
    convenience init(delegate: FeatureActionViewDelegate? = nil) {
        self.init(frame: .zero)
        self.delegate = delegate
        setupViewCode()
    }

    // MARK: - Actions
    @objc func simulateTap() {
        delegate?.didTapSimulate(view: self)
    }

    @objc func continueTap() {
        delegate?.didTapContinue(view: self)
    }
}

extension FeatureActionView: ViewCodedProtocol {
    func addViews() {
        addArrangedSubviews([simulateButton])
    }

    func addConstraints() {
        let constraints = [
            simulateButton.heightAnchor.constraint(equalToConstant: 48)
        ]
        addConstraints(constraints)
    }

    func setupViews() {
        axis = .vertical
        alignment = .fill
        distribution = .fill
        spacing = 16
        layoutMargins = UIEdgeInsets(
            top: 0,
            left: 16,
            bottom: 0,
            right: 16
        )
        isLayoutMarginsRelativeArrangement = true
    }
}

extension UIStackView {
    public func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { newView in 
            self.addConstraints(newView)
        }
    }
}
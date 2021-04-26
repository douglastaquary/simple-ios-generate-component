import Foundation

class FeatureContentView: UIStackView {

    let style: StyleProvider = Style()

    //MARK: - Views
    lazy var cardView: FeatureCardView = {
        let card = FeatureCardView()
        card.layer.borderWidth = 1
        card.layer.cornerRadius = 4
        card.layer.borderWidth = .gray
        return card
    }()

    lazy fileprivate(set) var activityIndicatorView = {
        let loading = UIActivityIndicatorView(frame: .zero)
        loading.hidesWhenStopped = true
        loading.style = .gray
        return loading
    }()

    // MARK: - Initializers
    convenience init() {
        self.init(frame: .zero)
        setupViewCode()
    }

    //MARK: - Setters
    func setupViewData(_ viewData: FeatureViewDataType) {
        cardView.setMessage(viewData.message)
    }

}

extension FeatureContentView: ViewCodedProtocol {
    func addViews() {
        addArrangedSubviews([cardView, activityIndicatorView])
    }

    func addConstraints() {
        let constraints = [
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailing.constraint(equalTo: trailingAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalToConstant: 120),
            cardView.widthAnchor.constraint(equalToConstant: 20),
            cardView.heightAnchor.constraint(equalToConstant: 20)
        ]
        addConstraints(constraints)
    }

    func setupViews() {
        axis = .vertical
        alignment = .center
        distribution = .fill
        spacing = 32
    }
}
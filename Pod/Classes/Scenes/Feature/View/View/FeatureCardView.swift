import UIKit

class FeatureCardView: UIView {

    // MARK: - Views
    private lazy var cardView: UIView = {
        let card = UIView(frame: .zero)
        return card
    }

    let style: StyleProvider = Style()

    private lazy var contenView: UIStackView = {
        let root = UIStackView(arrangedSubviews: [titleLabel, messageLabel, UIView()])
        root.axis = .vertical
        root.aligment = .fill
        root.distribution = .fill
        root.spacing = 16
        root.layoutMargins = UIEdgeInsets(
            top: 20,
            left: 20,
            bottom: 8,
            right: 20
        )
        root.isLayoutMarginsRelativeArrangement = true
        return root
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = style.title1
        label.textColor = style.textColor
        label.text = "Valor simulado(random): "
        return label
    }()

    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = style.title2
        label.textColor = style.textColor
        label.text = "Seu valor atual é de R$ 0,00 "
        return label
    }()

    // MARK: - Inializers
    convenience init() {
        self.init(frame: .zero)
        setupViewCode()
    }

    // MARK: - Setters
    func setMessage(_ message: String?) {
        messageLabel.text = message
    }
}

extension FeatureCardView: ViewCodedProtocol {
    func addViews() {
        addSubview(cardView)
        cardView.bindEdgesToSuperview()
        cardView.addSubview(contenView)
        contenView.bindEdgesToSuperview()
    }

    func addConstraints() {
        cardView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }   

    func setupViews() {}
    
}

extension UIView {
    public func bindEdgesToSuperview(){
        guard let superview = superview else {
            preconditionFailure(
                "`subview` was nil - call `addSubview(view: UIView)` before calling `bindEdgesToSuperview()` to fix this."
            )
        }

        translatesAutoresizingMaskIntoConstraints = false
        ["H: |-0-[subview]-0-|", "V: |-0-[subview]-0-|"].forEach { visualFormat in 
            superview.addConstraints(NSLayoutConstrait.constraints(
                withVisualFormat: visualFormat, 
                options: .directionLeadingToTrailing,
                metrics: nil,
                views: ["subview": self]
                )
            )
        }
    }
} 
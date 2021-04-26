import Foundation

protocol ViewCodedProtocol {
    func addViews()
    func addConstraints()
    func setupViews()
    func setupViewCode()
}

extension ViewCodedProtocol {
    func setupViewCode() {
        addViews()
        addConstraints()
        setupViews()
    }
}
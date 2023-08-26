import UIKit

class ViewController: UIViewController {

    private let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Make an order", for: [])
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(orderButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            orderButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: orderButton.trailingAnchor, multiplier: 2),
            orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


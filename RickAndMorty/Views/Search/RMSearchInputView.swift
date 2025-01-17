//
//  RMSearchInputView.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 08.01.2025.
//

import UIKit

protocol RMSearchInputViewDelegate: AnyObject {
    func rmSearchInputView(_ inputView: RMSearchInputView,
                           didSelectOption option: RMSearchInputViewViewModel.DynamicOption)
}

final class RMSearchInputView: UIView {

    // MARK: - Outlets

    weak var delegate: RMSearchInputViewDelegate?

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private var viewModel: RMSearchInputViewViewModel? {
        didSet {
            guard let viewModel = viewModel, viewModel.hasDynamicOptions else {
                return
            }
            let options = viewModel.options
            createOptionSelectionViews(options: options)
        }
    }

    private var stackView: UIStackView?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leftAnchor.constraint(equalTo: leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    private func creatteOptionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 6
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 58),
        ])
        return stackView
    }

    private func createOptionSelectionViews(options: [RMSearchInputViewViewModel.DynamicOption]) {
        let stackView = creatteOptionStackView()
        self.stackView = stackView
        for x in 0..<options.count {
            let option = options[x]
            let button = createButton(with: option, tag: x)
            stackView.addArrangedSubview(button)
        }
    }

    private func createButton(
        with option: RMSearchInputViewViewModel.DynamicOption,
        tag: Int
    ) -> UIButton {
        let button = UIButton()

        button.setAttributedTitle(
            NSAttributedString(
                string: option.rawValue,
                attributes: [
                    .font: UIFont.systemFont(ofSize: 18, weight: .medium),
                    .foregroundColor: UIColor.label
                ]),
            for: .normal)
        button.setTitle(option.rawValue, for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.backgroundColor = .secondarySystemFill
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.tag = tag
        button.layer.cornerRadius = 6

        return button
    }

    // MARK: - Actions

    @objc
    private func didTapButton(_ sender: UIButton) {
        guard let options = viewModel?.options else {
            return
        }
        let tag = sender.tag
        let selected = options[tag]

        delegate?.rmSearchInputView(self, didSelectOption: selected)
    }

    // MARK: - Public

    public func configure(with viewModel: RMSearchInputViewViewModel) {
        searchBar.placeholder = viewModel.searchPlaceholderText
        self.viewModel = viewModel
    }

    public func presentKeyboard() {
        searchBar.becomeFirstResponder()
    }

    public func update(option: RMSearchInputViewViewModel.DynamicOption, value: String) {
        // update options
        guard let buttons = stackView?.arrangedSubviews as? [UIButton],
              let allOptions = viewModel?.options,
              let index = allOptions.firstIndex(of: option) else {
            return
        }

        let button: UIButton = buttons[index]
        button.setAttributedTitle(
            NSAttributedString(
                string: value.uppercased(),
                attributes: [
                    .font: UIFont.systemFont(ofSize: 18, weight: .medium),
                    .foregroundColor: UIColor.link
                ]),
            for: .normal)
    }
}

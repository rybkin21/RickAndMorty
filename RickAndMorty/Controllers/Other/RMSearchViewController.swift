//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 24.12.2024.
//

import UIKit

/// Configure controller to search
final class RMSearchViewController: UIViewController {

    /// Configuration for search session
    struct Config {
        enum `Type` {
            case character
            case episode
            case location

            var title: String {
                switch self {

                case .character:
                    return "Search Characters"
                case .episode:
                    return "Search Episode"
                case .location:
                    return "Search Location"
                }
            }
        }

        let type: `Type`
    }

    private let config: Config

    // MARK: - Init

    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.title
        view.backgroundColor = .systemBackground
    }

}

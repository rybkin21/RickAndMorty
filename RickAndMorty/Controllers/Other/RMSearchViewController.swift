//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 24.12.2024.
//

import UIKit

/// Configure controller to search
final class RMSearchViewController: UIViewController {

    struct Config {
        enum `Type` {
            case character
            case episode
            case location
        }

        let type: `Type`
    }

    private let config: Config

    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Searh"
        view.backgroundColor = .systemBackground
    }
    

}

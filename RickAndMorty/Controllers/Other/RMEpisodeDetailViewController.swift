//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 13.12.2024.
//

import UIKit

class RMEpisodeDetailViewController: UIViewController {

    private let viewModel: RMEpisodeDetailViewViewModel

    // MARK: - Init

    init(url: URL?) {
        self.viewModel = .init(endpointUrl: url)

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemMint
    }
}

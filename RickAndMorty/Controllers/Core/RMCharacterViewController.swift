//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 07.11.2024.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"

        let request = RMRequest(endPoint: .character,
                                queryParameters: [
                                    URLQueryItem(name: "name", value: "rick"),
                                    URLQueryItem(name: "status", value: "alive")
                                ])
        print(request.url)

        RMService.shared.execute(request,
                                 expecting: String.self) { result in

            }
        }
    
}

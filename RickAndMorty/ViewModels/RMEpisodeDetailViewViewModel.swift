//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 13.12.2024.
//

import Foundation

class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?

    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }

    private func fetchEpisodeData() {
        guard let url = endpointUrl,
              let reqest = RMRequest(url: url) else {
            return
        }

        RMService.shared.execute(reqest,
                                 expecting: RMEpisode.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success))
            case .failure(let failure):
                break
            }
        }
    }
}

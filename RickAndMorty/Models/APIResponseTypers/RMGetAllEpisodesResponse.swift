//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 24.12.2024.
//

import Foundation

struct RMGetAllEpisodesResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMEpisode]
}

//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 07.11.2024.
//

import Foundation

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

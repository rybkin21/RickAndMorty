//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 07.11.2024.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}

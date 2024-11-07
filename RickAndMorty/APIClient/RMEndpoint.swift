//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 07.11.2024.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get loation info
    case loation
    /// Endpoint to get episode info
    case episode
}

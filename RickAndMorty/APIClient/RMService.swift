//
//  RMService.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 07.11.2024.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()

    /// Privatized constructor
    private init() {}

    /// Send Rick and Morty API Call
    /// - Parameters:
    ///    - reqest: Request instance
    ///    - completion: Callback with data or error
    public func execut(_ requst: RMRequest, completion: @escaping () -> Void) {

    }
}

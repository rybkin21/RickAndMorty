//
//  RMReqest.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 07.11.2024.
//

import Foundation

/// Object that represents a singlet API call
final class RMRequest {
    /// API Constans
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    /// Desired endpoint
    private let endPoint: RMEndpoint

    /// Path components for API, if any
    private let pathComponents: Set<String>

    /// Query components for API, if any
    private let queryParameters: [URLQueryItem]

    /// Constructed erl for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue

        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }

        if !pathComponents.isEmpty {
            string += "?"
          // name=value&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")

            string += argumentString
        }

        return string
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Despired http method
    public let httpMethod = "GET"

    // MARK: - Public

    
    /// Construct rquest
    /// - Parameters:
    ///   - endPoint: Target endpoint
    ///   - pathComponents: Collection path components
    ///   - queryParameters: Collection of query parameters
    public init(endPoint: RMEndpoint,
                pathComponents: Set<String> = [],
                queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

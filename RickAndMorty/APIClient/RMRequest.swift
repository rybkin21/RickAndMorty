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
    let endPoint: RMEndpoint

    /// Path components for API, if any
    private let pathComponents: [String]

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
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    /// Attemt to create request
    /// - Parameter url: URL to parse
    convenience init?(url: URL) {
         let string = url.absoluteString
         if !string.contains(Constants.baseUrl) {
             return nil
         }
         let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
         if trimmed.contains("/") {
             let components = trimmed.components(separatedBy: "/")
             if !components.isEmpty {
                 let endpointString = components[0] // Endpoint
                 var pathComponents: [String] = []
                 if components.count > 1 {
                     pathComponents = components
                     pathComponents.removeFirst()
                 }
                 if let rmEndpoint = RMEndpoint(
                     rawValue: endpointString
                 ) {
                     self.init(endPoint: rmEndpoint, pathComponents: pathComponents)
                     return
                 }
             }
         } else if trimmed.contains("?") {
             let components = trimmed.components(separatedBy: "?")
             if !components.isEmpty, components.count >= 2 {
                 let endpointString = components[0]
                 let queryItemsString = components[1]
                 // value=name&value=name
                 let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                     guard $0.contains("=") else {
                         return nil
                     }
                     let parts = $0.components(separatedBy: "=")

                     return URLQueryItem(
                         name: parts[0],
                         value: parts[1]
                     )
                 })

                 if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                     self.init(endPoint: rmEndpoint, queryParameters: queryItems)
                     return
                 }
             }
         }

         return nil
     }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endPoint: .character)
    static let listEpisodesRequest = RMRequest(endPoint: .episode)
}

//
//  RMAPICacheManager.swift
//  RickAndMorty
//
//  Created by Ivan Rybkin on 13.12.2024.
//

import Foundation

/// Manages in memory session scoped API caches
final class RMAPICacheManager {
    // API URL: Data

    private var cacheDictionary: [
        RMEndpoint: NSCache<NSString, NSData>
    ] = [:]

    init() {
        setUpCache()
    }

    // MARK: - Public

    public func cachedResponse(for endpoint: RMEndpoint, url: URL?) -> Data? {
        guard let targerCache = cacheDictionary[endpoint], let url = url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targerCache.object(forKey: key) as? Data
    }

    public func setCache(for endpoint: RMEndpoint, url: URL?, data: Data) {
        guard let targerCache = cacheDictionary[endpoint], let url = url else {
            return
        }
        let key = url.absoluteString as NSString
        targerCache.setObject(data as NSData, forKey: key)
    }

    // MARK: - Private

    private func setUpCache() {
        RMEndpoint.allCases.forEach({ endpoint in
            cacheDictionary[endpoint] = NSCache<NSString, NSData>()
        })
    }
}

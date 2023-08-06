//
//  RMApiCacheManager.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 8/6/23.
//

import Foundation

/// Manages inmemory session scoped API cache
final class RMApiCacheManager {
    // API URL : Data
    
    private var cacheDictionary: [
        RMEndpoint: NSCache<NSString, NSData>
    ] = [:]
    
    private var cache = NSCache<NSString, NSData>()
    
    // MARK: - init
    init(){
        setUpCache()
    }
    
    // MARK: public
    public func cachedResponse(for endpoint: RMEndpoint, url: URL?) -> Data? {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }
    
    public func setCache(for endpoint: RMEndpoint, url: URL?, data: Data) {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }
    
    // MARK: - private
    private func setUpCache() {
        RMEndpoint.allCases.compactMap({ endpoint in
            cacheDictionary[endpoint] = NSCache<NSString, NSData>()
        })
    }
}

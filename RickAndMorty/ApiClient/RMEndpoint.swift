//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 4/23/23.
//

import Foundation

/// Represents unique API endpoints
@frozen enum RMEndpoint: String, Hashable, CaseIterable {
    /// Endpoints to get character info
    case character // "character"
    /// Endpoints to get location info
    case location
    /// Endpoints to get episode info
    case episode
}

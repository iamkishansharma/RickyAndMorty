//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 4/23/23.
//

import Foundation

struct RMEpisode: Codable, RMEpisodeDataRender {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 5/29/23.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    let episodeDataUrl: URL?
    
    init (episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}

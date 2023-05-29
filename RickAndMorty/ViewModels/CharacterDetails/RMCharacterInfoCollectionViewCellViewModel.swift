//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 5/29/23.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    
    init (title: String, value: String) {
        self.title = title
        self.value = value
    }
}

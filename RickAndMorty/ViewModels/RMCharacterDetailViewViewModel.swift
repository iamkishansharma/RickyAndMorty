//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 5/18/23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    init (character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.capitalized
    }
}

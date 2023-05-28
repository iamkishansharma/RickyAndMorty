//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 5/18/23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    enum SectionType: CaseIterable {
        case photo
        case information
        case episodes
    }
    
    public let sections = SectionType.allCases
    
    // MARK: - Init
    
    init (character: RMCharacter) {
        self.character = character
    }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.capitalized
    }
    
//    public func fetchCharacterData() {
//        guard let url = requestUrl,
//              let request = RMRequest(url: url) else {
//            return
//        }
//
//        RMService.shared.execute(request, expecting: RMCharacter.self){ result in
//            switch result {
//            case .success(let success):
//                print(String(describing: success))
//            case .failure(let failure):
//                print(String(describing: failure))
//            }
//        }
//
//    }
}

//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 5/3/23.
//

import Foundation

struct RMGetAllCharactersResponse : Codable {
    struct Info: Codable {
        let count : Int
        let pages : Int
        let next : String?
        let prev : String?
    }
    
    let info : Info
    let results : [RMCharacter]
    
}

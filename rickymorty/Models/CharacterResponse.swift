//
//  ResponseCharacter.swift
//  rickymorty
//
//  Created by Felipe Santos on 07/12/24.
//

struct CharacterResponse: Decodable {
    let info: Info
    let results: [Character]
}

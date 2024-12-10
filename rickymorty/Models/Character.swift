//
//  Item.swift
//  rickymorty
//
//  Created by Felipe Santos on 07/12/24.
//


import SwiftData
import SwiftUI

struct Character: Identifiable, Decodable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String

    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
}

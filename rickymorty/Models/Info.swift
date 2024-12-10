//
//  Info.swift
//  rickymorty
//
//  Created by Felipe Santos on 08/12/24.
//

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

//
//  Item.swift
//  rickymorty
//
//  Created by Felipe Santos on 07/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

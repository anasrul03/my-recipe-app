//
//  Item.swift
//  MyRecipe
//
//  Created by Hanasrullah Halim on 14/08/2024.
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

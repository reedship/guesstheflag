//
//  Item.swift
//  guesstheflag
//
//  Created by Reed on 4/8/24.
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

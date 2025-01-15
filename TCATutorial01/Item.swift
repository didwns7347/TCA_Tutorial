//
//  Item.swift
//  TCATutorial01
//
//  Created by yangjs on 1/15/25.
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

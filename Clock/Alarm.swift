//
//  Alarm.swift
//  Clock
//
//  Created by Yongye on 11/3/24.
//

import Foundation

struct Alarm: Identifiable {
    var id: UUID
    var date: Date
    var label: String
    var isEnabled: Bool

    init(id: UUID = UUID(), date: Date, label: String, isEnabled: Bool) {
        self.id = id
        self.date = date
        self.label = label == "" ? "Alarm" : label
        self.isEnabled = isEnabled
    }
}

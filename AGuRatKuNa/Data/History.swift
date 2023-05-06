//
//  History.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/05/07.
//

import Foundation

struct History: Identifiable {
    let id: UUID
    let date: Date
    var fighters: [DailyFight.Fighters]
    
    init(id: UUID = UUID(), date: Date = Date(), fighters: [DailyFight.Fighters]) {
        self.id = id
        self.date = date
        self.fighters = fighters
    }
}

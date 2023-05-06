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
}

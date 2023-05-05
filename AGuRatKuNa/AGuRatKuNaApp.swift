//
//  AGuRatKuNaApp.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/06.
//

import SwiftUI

@main
struct AGuRatKuNaApp: App {
    @State var fights = DailyFight.sampleData
    var body: some Scene {
        WindowGroup {
            FightsView(fights: $fights)
        }
    }
}

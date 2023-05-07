//
//  AGuRatKuNaApp.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/06.
//

import SwiftUI

@main
struct AGuRatKuNaApp: App {
    @StateObject private var store = FightStore()
    var body: some Scene {
        WindowGroup {
            FightsView(fights: $store.fights) {
                Task {
                    do {
                                          try await store.save(savingFights: store.fights)
                                      } catch {
                                          fatalError(error.localizedDescription)
                                      }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}

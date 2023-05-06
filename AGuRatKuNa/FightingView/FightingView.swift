//
//  FightingView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/22.
//

import SwiftUI

struct FightingView: View {
    @Binding var fight: DailyFight
    @StateObject var fightTimer = FightTimer()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(fight.theme.mainColor)
            VStack {
                FightingHeaderView(secondsElapsed: fightTimer.secondsElapsed, secondsRemaining: fightTimer.secondsRemaining, theme: fight.theme)
                FightingContentsView(fight: fight)
                FightingFooterView(realFighters: fightTimer.realFighters, skipAction: fightTimer.skipFighter)
            }
        }
        .padding()
        .onAppear {
                    fightTimer.reset(fightTimes: fight.fightTimes, fighters: fight.fighters)
                    fightTimer.startScrum()
                }
                .onDisappear {
                    fightTimer.stopFight()
                    let newHistory = History(id: UUID(), date: Date(), fighters: fight.fighters)
                    fight.history.insert(newHistory, at: 0)
                }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FightingView_Previews: PreviewProvider {
    static var previews: some View {
        FightingView(fight: .constant(DailyFight.sampleData[2]))
    }
}

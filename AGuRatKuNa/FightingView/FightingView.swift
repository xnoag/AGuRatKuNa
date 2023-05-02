//
//  FightingView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/22.
//

import SwiftUI

struct FightingView: View {
    var fight: DailyFight
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(fight.theme.mainColor)
            VStack {
                FightingHeaderView(secondsElapsed: 400, secondsRemaining: 600, theme: fight.theme)
                FightingContentsView(fight: fight)
                FightingFooterView(fight: fight)
            }
        }
        .padding()
    }
}

struct FightingView_Previews: PreviewProvider {
    static var previews: some View {
        FightingView(fight: DailyFight.sampleData[2])
    }
}

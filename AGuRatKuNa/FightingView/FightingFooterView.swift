//
//  FightingFooterView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/22.
//

import SwiftUI

struct FightingFooterView: View {
    var fight: DailyFight
    var body: some View {
        HStack {
            Text("Speaker 1 of \(fight.fighters.count)")
            Spacer()
            Button(action: {}) {
                Image(systemName: "forward.fill")
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct FightingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        FightingFooterView(fight: DailyFight.sampleData[0])
    }
}

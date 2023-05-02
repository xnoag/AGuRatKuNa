//
//  FightingContentsView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/22.
//

import SwiftUI

struct FightingContentsView: View {
    var fight: DailyFight
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .foregroundColor(fight.theme.accentColor)
            .padding()
            .overlay {
                VStack {
                    Text(fight.fighters[0].fighterName)
                        .font(.title)
                    Text("is speaking")
                    Image(systemName: "mic")
                        .font(.title)
                        .padding(.top)
                }
                .foregroundStyle(fight.theme.accentColor)
            }
    }
}

struct FightingContentsView_Previews: PreviewProvider {
    static var previews: some View {
        FightingContentsView(fight: DailyFight.sampleData[0])
    }
}

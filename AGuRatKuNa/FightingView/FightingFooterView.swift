//
//  FightingFooterView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/22.
//

import SwiftUI

struct FightingFooterView: View {
    let realFighters: [FightTimer.Fighter]
    var skipAction: ()->Void
    
    private var fighterNumber: Int? {
        guard let index = realFighters.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    private var isLastFighter: Bool {
        return realFighters.dropLast().allSatisfy { $0.isCompleted }
    }
    private var fighterText: String {
        guard let fighterNumber = fighterNumber else { return "No more realFighters" }
        return "Speaker \(fighterNumber) of \(realFighters.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastFighter {
                    Text("Last Speaker")
                } else {
                    Text(fighterText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct FightingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        FightingFooterView(realFighters: DailyFight.sampleData[0].fighters.realFighters, skipAction: {})
    }
}

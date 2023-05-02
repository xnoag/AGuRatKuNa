//
//  FightingHeaderView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/22.
//

import SwiftUI

struct FightingHeaderView: View {
    
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(secondsRemaining)
    }
    
    var theme: Theme
    
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ColoredProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .padding()
    }
}

struct FightingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FightingHeaderView(secondsElapsed: 400, secondsRemaining: 600, theme: .gaonRed)
    }
}

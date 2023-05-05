//
//  DetailEditView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/14.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var fight: DailyFight
//    @State var text: String = ""
//    @State var fightTimes: Double = 10.0
//    @State var theme: Theme = .gaonRed
    @State private var newFighter = ""
//    @State var fighters: [DailyFight.Fighters] = []
    
    var body: some View {
        Form {
            // FIGHTING INFO Section
            Section(header: Text("FIGHTING INFO")) {
                TextField("Title", text: $fight.title)
                HStack {
                    Slider(
                        value: $fight.fightTimesByDouble,
                        in: 0...60,
                        step: 5
                    )
                    Text("\(Int(fight.fightTimes)) Minutes")
                }//HStack
                Picker("Theme", selection: $fight.theme) {
                        ForEach(Theme.allCases) { themee in
                            Label("\(themee.colorName)", systemImage: "paintpalette").tag(themee)
                        }
//                        Label("Red", systemImage: "paintpalette").tag(Theme.gaonRed)
//                        Label("Yellow", systemImage: "paintpalette").tag(Theme.gaonYellow)
//                        Label("Blue", systemImage: "paintpalette").tag(Theme.gaonBlue)
//                        Label("Green", systemImage: "paintpalette").tag(Theme.gaonGreen)
                }
            }
            // FIGHTERS Section
            Section(header: Text("FIGHTERS")) {
                ForEach(fight.fighters) { fighters in
                    Text(fighters.fighterName)
                }
                .onDelete { indices in
                    fight.fighters.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Fighter", text: $newFighter)
                    Button(action: {
                        fight.fighters.append(DailyFight.Fighters(fighterName: newFighter))
                        newFighter = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }//Button
                    .disabled(newFighter.isEmpty)
                }//HStack
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(fight: .constant(DailyFight.sampleData[0]))
    }
}

//
//  DetailEditView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/14.
//

import SwiftUI

struct DetailEditView: View {
    
    @State var text: String = ""
    @State var fightTimes: Double = 10.0
    @State var theme: Theme = .gaonRed
    @State private var newFighter = ""
    @State var fighters: [DailyFight.Fighters] = []
    
    var body: some View {
        Form {
            // FIGHTING INFO Section
            Section(header: Text("FIGHTING INFO")) {
                TextField("Title", text: $text)
                HStack {
                    Slider(
                        value: $fightTimes,
                        in: 0...60,
                        step: 5
                    )
                    Text("\(Int(fightTimes)) Minutes")
                }//HStack
                    Picker("Theme", selection: $theme) {
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
                ForEach(fighters) { fighters in
                    Text(fighters.fighterName)
                }
                .onDelete { indices in
                    fighters.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Fighter", text: $newFighter)
                    Button(action: {
                        fighters.append(DailyFight.Fighters(fighterName: newFighter))
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
        DetailEditView()
    }
}

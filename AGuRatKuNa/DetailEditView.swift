//
//  DetailEditView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/14.
//

import SwiftUI

struct DetailEditView: View {
    
    @State var text = ""
    @State var fightTimes = 10.0
    @State var theme: Theme = .gaonRed
    
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
                        Label("Red", systemImage: "paintpalette").tag(Theme.gaonRed)
                        Label("Yellow", systemImage: "paintpalette").tag(Theme.gaonYellow)
                        Label("Blue", systemImage: "paintpalette").tag(Theme.gaonBlue)
                        Label("Green", systemImage: "paintpalette").tag(Theme.gaonGreen)
                }
            }
            // FIGHTERS Section
            Section {
                
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}

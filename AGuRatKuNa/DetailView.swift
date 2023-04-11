//
//  DetailView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/11.
//

import SwiftUI

struct DetailView: View {
    // DailyFight 타입을 따르는 저장 프로퍼티(변수)를 정의한다. 그래야만 DailyFight에서 저장한 그 저장 프로퍼티에 접근할 수 있다.
    var fight: DailyFight
    
    var body: some View {
        List {
            // Fighting Info Section
            Section(header: Text("Fighting Info")) {
                Label("Start Fighting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(fight.fightTimes) minutes")
                }
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(fight.theme.colorName)
                        .padding(4)
                        .foregroundColor(fight.theme.accentColor)
                        .background(fight.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            
            // Fighters Info Section
            Section(header: Text("Fighters")) {
                
            }
            
            // History Section
            Section(header: Text("History")) {
                
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(fight: DailyFight.sampleData[0])
    }
}

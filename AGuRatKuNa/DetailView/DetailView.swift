//
//  DetailView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/11.
//

import SwiftUI

struct DetailView: View {
    // DailyFight 타입을 따르는 저장 프로퍼티(변수)를 정의한다. 그래야만 DailyFight에서 저장한 그 저장 프로퍼티에 접근할 수 있다.
    @Binding var fight: DailyFight
    @State private var isShowingSheet = false
    
    var body: some View {
        List {
            // Fighting Info Section
            Section(header: Text("Fighting Info")) {
                NavigationLink(destination: FightingView(fight: fight)) {
                    Label("Start Fighting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
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
                // Fighters를 ForEach로 접근해서 데이터를 뿌려줄 건데, DailyFight의 fighters 배열에 접근해서 각각의 요소들을 ForEach로 뿌려줄 건데, 이 때 fighters 배열 자체가 ForEach가 인식할 수 있도록 Identifiable 해야한다. 그러니까, fighters 배열에 id를 생성하러 가자.
                ForEach(fight.fighters) {fighter in
                    Label(fighter.fighterName, systemImage: "person")
                }
            }
            
            // History Section
            Section(header: Text("History")) {
                Label("No Fighters Yet", systemImage: "calendar.badge.exclamationmark")
            }
            
        }
        .navigationTitle(fight.title)
        .toolbar {
            Button("Edit") {
                isShowingSheet.toggle()
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            NavigationView {
                DetailEditView(fight: $fight)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isShowingSheet.toggle()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isShowingSheet.toggle()
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(fight: .constant(DailyFight.sampleData[0]))
    }
}

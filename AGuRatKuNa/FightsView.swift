//
//  FightsView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/10.
//

import SwiftUI

struct FightsView: View {
    // FightsView에서 DailyFight.Swift 파일에 있는 데이터를 통해 [DailyFight] 형태의 배열을 가져오게 하기 위해서 프로퍼티를 정의해준다.
    // 그리고 이 fights라는 변수는 FightsView 구조체의 매게변수(parameter)로써 작용을 한다.
    var fights: [DailyFight]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FightsView_Previews: PreviewProvider {
    static var previews: some View {
        // fights라는 매게변수를 위에서 부여를 했기때문에, 그 매게변수가 어떤 데이터를 가져오는지 표기를 해줘야한다.
        // sampleData라는 게 DailyFight.Swift에서 static으로 정의를 해줬기 때문에, 이건 타입 프로퍼티고 이 타입 프로퍼티는 인스턴스로 접근하는 게 아니라, 타입 자체로 접근을 해야하니까, DailyFight.sampleData로 데이터를 불러와야한다.
        FightsView(fights: DailyFight.sampleData)
    }
}

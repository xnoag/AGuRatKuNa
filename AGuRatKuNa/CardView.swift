//
//  CardView.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/07.
//  메인 화면에 띄워줄 그 싸움의 리스트를 정의할 건데, 하나를 만들고 전체를 뿌려주기 전 작업.

import SwiftUI

struct CardView: View {
    // DailyFight 타입을 따르는 저장 프로퍼티(변수)를 정의한다. 그래야만 DailyFight에서 저장한 그 저장 프로퍼티에 접근할 수 있다.
    var fight: DailyFight
    var body: some View {
        VStack(alignment: .leading) {
            Text(fight.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(fight.fighters.count)", systemImage: "person.3")
                Spacer()
                // Label 스타일을 숫자가 아이콘보다 먼저 나오게 하고 싶다. 커스텀하러 가자.
                Label("\(fight.fightTimes)", systemImage: "clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(fight.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    // Preview 화면에 뭘 보여줄 건지 프로퍼티를 정의해준다.
    // sampleData의 첫번째 인덱스 내용을 뿌려주겠다.
    static var fightPreview = DailyFight.sampleData[0]
    static var previews: some View {
        // fight라는 이름의 파라미터(매게변수)가 필요한데, 그 파라미터로 fioghtPreview를 전달해주겠다.
        CardView(fight: fightPreview)
            .background(fightPreview.theme.mainColor)
            // CardView 크기를 정의해주겠다.
            .previewLayout(.fixed(width: 400, height: 60))
    }
}

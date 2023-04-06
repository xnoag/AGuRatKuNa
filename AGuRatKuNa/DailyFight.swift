//
//  DailyFight.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/06.
//  View들 사이에 보여줄 정보에 대한 구조체를 새로이 정리한다.

import Foundation

struct DailyFight {
    // 이 데이터들을 가지고 정보를 뷰마다 주고받고 할 거임.
    var title: String
    var fightTimes: Int
    var fighters: [String]
    // Theme 프로퍼티도 저장을 할 건데, Theme 타입이 정의가 안 되어 있기 때문에 정의해준다.
    // Theme 정의하고옴.
    var theme: Theme
}

// 앱에 꼭 필요한 내용은 아니지만, 시뮬레이터로 미리보기 할 때 아무 것도 안 보이면 곤란하니까 샘플로 몇가지 정도만 보여주게 하자.
// extension은 구조체에 기능을 추가할 때 사용한다.
extension DailyFight {
    static let sampleData: [DailyFight] =
    [
        DailyFight(title: "누가 닭다리를 두 개 먹었는가?", fightTimes: 10, fighters: ["박가온", "김릴리", "김억두"], theme: .gaonRed),
        DailyFight(title: "누가 내 엉덩이를 만졌는가?", fightTimes: 5, fighters: ["최가온", "왕릴리", "강억두", "신짱구"], theme: .gaonYellow),
        DailyFight(title: "누가 사고 냈냐?", fightTimes: 4, fighters: ["김가온", "박릴리", "김철수", "훈발놈"], theme: .gaonBlue)
    ]
}

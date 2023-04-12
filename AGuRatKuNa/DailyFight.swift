//
//  DailyFight.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/06.
//  View들 사이에 보여줄 정보에 대한 구조체를 새로이 정리한다.

import Foundation

struct DailyFight: Identifiable {
    // 이 데이터들을 가지고 정보를 뷰마다 주고받고 할 거임.
    
    // sampleData를 ForEach를 활용해서 뿌려줄건데, 이 ForEach가 배열의 각각의 요소에 접근하고 이를 식별할 수 있어야 하기 때문에 id라는 요소를 넣어주고, 유니크 id를 생성할 수 있는 UUID 타입을 따르도록 한다. id를 가장 먼저 쓰는 습관을 들이자 <- id가 각 요소를 식별하는데 가장 핵심적인 역할을 하기 때문에.
    var id: UUID
    var title: String
    var fightTimes: Int
    // [Fighters]로 타입을 바꿔준다.
    var fighters: [Fighters]
    // Theme 프로퍼티도 저장을 할 건데, Theme 타입이 정의가 안 되어 있기 때문에 정의해준다.
    // Theme 정의하고옴.
    var theme: Theme
    
    // title이나, fightTimes, fighters, theme 같은 경우에는, 밑에 sampleData를 작성할 때, 각각의 값을 써줄 수 있는 놈들인데, 이 UUID 타입을 따르는 id 프로퍼티는 내가 직접 값을 넣을 수 있는 게 아니라, 이 UUID가 직접 지정을 해주는 것이기 때문에, UUID() 초기화(이니셜라이징)을 해줘야한다.
    init(id: UUID = UUID(), title: String, fightTimes: Int, fighters: [String], theme: Theme) {
        self.id = id
        self.title = title
        self.fightTimes = fightTimes
        // fighters 배열을 { } 안의 형태로 매핑을 할 거다. { } 안의 내용은, fighters의 각 요소를 Fighters의 fighterName에 부여하는 형태로.
        self.fighters = fighters.map { Fighters(fighterName: $0) }
        self.theme = theme
    }
}

// fighters 배열을 id가 포함된 구조체로 정의해주자.
extension DailyFight {
    struct Fighters: Identifiable {
        var id: UUID
        var fighterName: String
        
        init(id: UUID = UUID(), fighterName: String) {
            self.id = id
            self.fighterName = fighterName
        }
    }
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

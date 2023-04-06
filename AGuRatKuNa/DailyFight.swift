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
}

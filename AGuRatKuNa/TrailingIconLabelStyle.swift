//
//  TrailingIconLabelStyle.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/07.
//  CardView에서 원하는 라벨(숫자가 왼쪽, 아이콘이 오른쪽)을 만들기 위해서

import Foundation
import SwiftUI

// 나만의 커스텀 라벨을 만들려면 LabelStyle 프로토콜을 준수해야되는데, 이 프로토콜을 SwiftUI Framework에서 제공하니까 import해준다.
// LabelStyle 프로토콜을 사용하려면, 그 프로토콜이 필수적으로 어떤걸 구현해줘야되는지 도큐먼트를 찾아봤다.
// makeBody라는 함수를 정의해줘야하고, Body와 associated 돼야한다.
struct TrailingIconLabelStyle: LabelStyle {
    // LabelStyle 프로토콜을 따를 때 필수적으로 구현해줘야되는 거 1번
    func makeBody(configuration: Configuration) -> some View {
        // 수평으로 좌타이틀 우아이콘 설정을 해준다.
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

//
//  Theme.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/04/06.
//  DailyFight 구조체에 들어갈 Theme을 정의해준다.

import Foundation
// Color는 SwiftUI Framework에서 제공하는 기능이므로 import 해준다.
import SwiftUI

enum Theme: String {
    // 이런 색상들을 쓸거다.
    case gaonRed
    case gaonYellow
    case gaonGreen
    case gaonBlue
    
    // 화면 배경에 띌 메인 색상을 정의한다.
    var mainColor: Color {
        // Color는 rawValue로 접근할 수 있다.
        Color(rawValue)
    }
    
    // 화면 배경색에 맞는 accentColor 정의
    var accentColor: Color {
        // Theme이 이거일 땐 .white, 저거일 땐 .black을 Return 해주게 한다.
        switch self {
        case .gaonRed, .gaonGreen, .gaonBlue:
            return .white
        case .gaonYellow:
            return .black
        }
    }
    
    // Color 이름 정의
    var colorName: String {
        String(rawValue)
    }
}

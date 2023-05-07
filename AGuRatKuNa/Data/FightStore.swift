//
//  FightStore.swift
//  AGuRatKuNa
//
//  Created by xnoag on 2023/05/07.
//

import SwiftUI
import Combine

// Main Thread에서 작업하게 하기.
@MainActor

// 매번 View끼리 @State와 @Binding으로 정보를 주고받고 하기 번거로우니까, ObservableObject 프로토콜을 준수하는 class를 생성한다.
class FightStore: ObservableObject {
    
    
    // fights는 변경될 거니까, FightStore이 변경 여부를 관찰해야하므로 @Published 래퍼를 붙힌다.
    @Published var fights: [DailyFight] = []
    
    
    // FileManager를 통해서, "fights.data"라는 이름의 URL(파일의 경로)을 return하는 함수인 fileURL()을 만든다.
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("fights.data")
    }
    
    
    // fileURL()을 통해 return 받은 URL으로부터 데이터를 불러오는 비동기(async)함수를 만든다. 왜 비동기 함수냐? fileURL()라는 함수에서 어떤 URL을 리턴 받은 이후에 데이터를 불러올 수 있기 때문이다.
    func load() async throws {
        // [DailyFight] 형태의 Decode된 데이터 또는 Error를 받아올 수 있도록 task라는 상수를 선언해준다.
        let task = Task<[DailyFight], Error> {
            // fileURL()을 통해 받아온 URL을 fileURL이라는 상수에 할당해준다.
            let fileURL = try Self.fileURL()
            // 그 fileURL을 통해 데이터를 받아와서 data라는 상수에 할당하고, 받아올 게 없으면 빈 배열을 반환한다.
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            // 데이터를 받은 data로 부터, JSON 데이터를 JSONDecoder()를 사용해서 [DailyFight] 형태로 Decode하고 dailyFights에 할당한다.
            let dailyFights = try JSONDecoder().decode([DailyFight].self, from: data)
            // task에 dailyFights를 반환한다.
            return dailyFights
        }
        // task에 반환된 [DailyFight] 형태의 데이터를 decodedFights에 할당해준다.
        let decodedFights = try await task.value
        // fights에 decodedFights를 할당한다.
        self.fights = decodedFights
    }
    
    
    // 데이터를 저장하는 함수를 만든다. parameter는 [DailyFight] 형태이다.
    func save(savingFights: [DailyFight]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(savingFights)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}


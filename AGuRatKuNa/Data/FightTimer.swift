/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

/// Keeps time for a daily scrum meeting. Keep track of the total meeting time, the time for each Fighter, and the name of the current Fighter.
class FightTimer: ObservableObject {
    /// A struct to keep track of meeting fighters during a meeting.
    struct Fighter: Identifiable {
        /// The Fighters name.
        let name: String
        /// True if the Fighters has completed their turn to speak.
        var isCompleted: Bool
        /// Id for Identifiable conformance.
        let id = UUID()
    }
    
    /// The name of the meeting Fighters who is speaking.
    @Published var activeFighter = ""
    /// The number of seconds since the beginning of the meeting.
    @Published var secondsElapsed = 0
    /// The number of seconds until all fighters have had a turn to speak.
    @Published var secondsRemaining = 0
    /// All meeting fighters, listed in the order they will speak.
    private(set) var realFighters: [Fighter] = []

    /// The scrum meeting length.
    private(set) var fightTimes: Int
    /// A closure that is executed when a new Fighters begins speaking.
    var fighterChangedAction: (() -> Void)?

    private var timer: Timer?
    private var timerStopped = false
    private var frequency: TimeInterval { 1.0 / 60.0 }
    private var lengthInSeconds: Int { fightTimes * 60 }
    private var secondsPerFighter: Int {
        (fightTimes * 60) / realFighters.count
    }
    private var secondsElapsedForFighter: Int = 0
    private var fighterIndex: Int = 0
    private var fighterText: String {
        return "Fighter \(fighterIndex + 1): " + realFighters[fighterIndex].name
    }
    private var startDate: Date?
    
    /**
     Initialize a new timer. Initializing a time with no arguments creates a FightTimer with no fighters and zero length.
     Use `startScrum()` to start the timer.
     
     - Parameters:
        - fightTimes: The meeting length.
        -  fighters: A list of fighters for the meeting.
     */
    init(fightTimes: Int = 0, fighters: [DailyFight.Fighters] = []) {
        self.fightTimes = fightTimes
        self.realFighters = fighters.realFighters
        secondsRemaining = lengthInSeconds
        activeFighter = fighterText
    }
    
    /// Start the timer.
    func startScrum() {
        changeToFighter(at: 0)
    }
    
    /// Stop the timer.
    func stopFight() {
        timer?.invalidate()
        timer = nil
        timerStopped = true
    }
    
    /// Advance the timer to the next Fighter.
    func skipFighter() {
        changeToFighter(at: fighterIndex + 1)
    }

    private func changeToFighter(at index: Int) {
        if index > 0 {
            let previousFighterIndex = index - 1
            realFighters[previousFighterIndex].isCompleted = true
        }
        secondsElapsedForFighter = 0
        guard index < realFighters.count else { return }
        fighterIndex = index
        activeFighter = fighterText

        secondsElapsed = index * secondsPerFighter
        secondsRemaining = lengthInSeconds - secondsElapsed
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            if let self = self, let startDate = self.startDate {
                let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
                self.update(secondsElapsed: Int(secondsElapsed))
            }
        }
    }

    private func update(secondsElapsed: Int) {
        secondsElapsedForFighter = secondsElapsed
        self.secondsElapsed = secondsPerFighter * fighterIndex + secondsElapsedForFighter
        guard secondsElapsed <= secondsPerFighter else {
            return
        }
        secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)

        guard !timerStopped else { return }

        if secondsElapsedForFighter >= secondsPerFighter {
            changeToFighter(at: fighterIndex + 1)
            fighterChangedAction?()
        }
    }
    
    /**
     Reset the timer with a new meeting length and new fighters.
     
     - Parameters:
         - fightTimes: The meeting length.
         - fighters: The name of each Fighters.
     */
    func reset(fightTimes: Int, fighters: [DailyFight.Fighters]) {
        self.fightTimes = fightTimes
        self.realFighters = fighters.realFighters
        secondsRemaining = lengthInSeconds
        activeFighter = fighterText
    }
}

extension DailyFight {
    /// A new `FightTimer` using the meeting length and fighters in the `DailyFight`.
    var timer: FightTimer {
        FightTimer(fightTimes: fightTimes, fighters: fighters)
    }
}

extension Array where Element == DailyFight.Fighters {
    var realFighters: [FightTimer.Fighter] {
        if isEmpty {
            return [FightTimer.Fighter(name: "Fighter 1", isCompleted: false)]
        } else {
            return map { FightTimer.Fighter(name: $0.fighterName, isCompleted: false) }
        }
    }
}

//
//  Days.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 30/03/2023.
//

import Foundation

struct PreviewContent {
//    var viewModel: DaysViewModel
    init() {
//        viewModel = DaysViewModel(Self.days.orderedByDate)
    }
}

extension PreviewContent {
    static var dayInSeconds: TimeInterval = 60 * 60 * 24
    
    
    static var day14: Day { Day([.joy, .happiness, .anger, .fun, .calmness], date: .goingBack(13)) }
    static var day13: Day { Day([.sadness, .helplessness, .boredom, .anger, .awkwardness], date: .goingBack(12)) }
    static var day12: Day { Day([.helplessness, .boredom, .anger, .sadness, .fun], date: .goingBack(11)) }
    static var day11: Day { Day([.sadness, .helplessness, .calmness, .anger, .fun], date: .goingBack(10)) }
    static var day10: Day { Day([.joy, .happiness, .anger, .fun, .calmness], date: .goingBack(9)) }
    static var day9: Day { Day([.joy, .happiness, .fun, .calmness, .excitement], date: .goingBack(8)) }
    static var day8: Day { Day([.helplessness, .boredom, .anger, .sadness, .fun], date: .goingBack(7)) }
    
    static var day7: Day { Day([.sadness, .helplessness, .boredom, .anger, .awkwardness], date: .goingBack(6)) }
    static var day6: Day { Day([.helplessness, .boredom, .anger, .sadness, .fun], date: .goingBack(5)) }
    static var day5: Day { Day([.sadness, .helplessness, .calmness, .anger, .fun], date: .goingBack(4)) }
    static var day4: Day { Day([.joy, .happiness, .anger, .fun, .calmness], date: Date(timeIntervalSinceNow: -3 * dayInSeconds)) }
    static var day3: Day { Day([.joy, .happiness, .fun, .calmness, .excitement], date: Date(timeIntervalSinceNow: -2 * dayInSeconds)) }
    static var day2: Day { Day([.helplessness, .boredom, .anger, .sadness, .fun], date: Date(timeIntervalSinceNow: -dayInSeconds)) }
    static var today: Day { Day([.joy, .happiness, .anger, .fun, .calmness], date: Date()) }
    
    static var sevenDays: [Day] { [today, day2, day3, day4, day5, day2, today] }
    static var fourteenDays: [Day] { sevenDays + [day8, day9, day10, day11, day12, day13, day14] }
}



private extension JournalEntry {
    convenience init(_ feeling: Feeling) {
        self.init("", feeling: feeling)
    }
}

private extension Day {
    convenience init(_ feelings: [Feeling], date: Date) {
        self.init(feelings.map { JournalEntry($0) }, date: date)
    }
}

private extension Date {
    static var dayInSeconds: TimeInterval = 60 * 60 * 24
    static func goingBack(_ days: Double) -> Date {
        Date(timeIntervalSinceNow: -days * dayInSeconds)
    }
}

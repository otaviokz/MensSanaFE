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
    static var day1: Day { Day([.sadness, .helplessness, .boredom, .anger, .awkwardness], date: Date(timeIntervalSinceNow: -6 * dayInSeconds)) }
    static var day2: Day { Day([.helplessness, .boredom, .anger, .sadness, .fun], date: Date(timeIntervalSinceNow: -5 * dayInSeconds)) }
    static var day3: Day { Day([.sadness, .helplessness, .calmness, .anger, .fun], date: Date(timeIntervalSinceNow: -4 * dayInSeconds)) }
    static var day4: Day { Day([.joy, .happiness, .anger, .fun, .calmness], date: Date(timeIntervalSinceNow: -3 * dayInSeconds)) }
    static var day5: Day { Day([.joy, .happiness, .fun, .calmness, .excitement], date: Date(timeIntervalSinceNow: -2 * dayInSeconds)) }
    static var day6: Day { Day([.helplessness, .boredom, .anger, .sadness, .fun], date: Date(timeIntervalSinceNow: -dayInSeconds)) }
    static var day7: Day { Day([.joy, .happiness, .anger, .fun, .calmness], date: Date()) }
    static var days: [Day] { [day1, day2, day3, day4, day5, day6, day7] }
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

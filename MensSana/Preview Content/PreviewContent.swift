//
//  Days.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 30/03/2023.
//

import Foundation

struct PreviewContent {
    var days: [Day]
    
    init() {
        self.days = Self.weekDays
        let calendar = Calendar.current
        
        for day in self.days {
            let components = calendar.dateComponents([.day, .month, .year, .hour], from: day.date)
            let dayOfMonth = components.day
            let month = components.month
            let year = components.year
            let hour = components.hour
            print("\(dayOfMonth!)/\(month!)/\(year!) - \(hour!)")
            print(day.entries)
            print(day.dayType)
            
        }
    }
}

private extension PreviewContent {
    static var dayInSeconds: TimeInterval = 60 * 60 * 24
    static var day1: Day { Day([.sadness, .helplessness, .boredom, .anger, .awkwardness], date: Date(timeIntervalSinceNow: -4 * dayInSeconds)) }
    static var day2: Day { Day([.helplessness, .boredom, .anger, .sadness, .fun], date: Date(timeIntervalSinceNow: -3 * dayInSeconds)) }
    static var day3: Day { Day([.sadness, .helplessness, .calmness, .anger, .fun], date: Date(timeIntervalSinceNow: -2 * dayInSeconds)) }
    static var day4: Day { Day([.joy, .happiness, .anger, .fun, .calmness], date: Date(timeIntervalSinceNow: -1 * dayInSeconds)) }
    static var day5: Day { Day([.joy, .happiness, .fun, .calmness, .excitement], date: Date()) }
    static var weekDays: [Day] { [day1, day2, day3, day4, day5] }
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

//
//  Day.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 26/03/2023.
//

import SwiftUI
import Combine
import Foundation

class Day: ObservableObject, Identifiable {
    let id = UUID()
    @Published private(set) var entries: [JournalEntry] = []
    @Published private(set) var grade: DayGrade = .indiferent
    
    lazy var dateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    var dateString: String { dateFormatter.string(from: date)}
    var date: Date
    private var day: DayGrade = .dreadfull
    private var cancellables = Set<AnyCancellable>()
    
    init(_ entries: [JournalEntry], date: Date = .now) {
        self.entries = entries
        self.date = date
        dayTypePublisher.assign(to: &$grade)
    }
    
    private lazy var dayTypePublisher: AnyPublisher<DayGrade, Never> = {
        $entries.map { array -> DayGrade in
            return DayGrade(array.reduce(0) { $0 + $1.feeling.score })
        }.eraseToAnyPublisher()
    }()
}

extension Day: Equatable {
    static func == (lhs: Day, rhs: Day) -> Bool {
        lhs.date == rhs.date
    }
}

extension Array where Element == Day {
    var orderedByDate: [Day] {
        sorted { $0.date < $1.date }
    }
}

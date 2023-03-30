//
//  Day.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 26/03/2023.
//

import SwiftUI
import Combine
import Foundation

class Day: ObservableObject {
    @Published private(set) var entries: [JournalEntry] = []
    @Published private(set) var dayType: DayGrade = .indiferent
    var date: Date
    private var day: DayGrade = .dreadfull
    private var cancellables = Set<AnyCancellable>()
    
    init(_ entries: [JournalEntry], date: Date = .now) {
        self.entries = entries
        self.date = date
        dayTypePublisher.assign(to: &$dayType)
    }
    
    private lazy var dayTypePublisher: AnyPublisher<DayGrade, Never> = {
        $entries.map { array -> DayGrade in
            return DayGrade(array.reduce(0) { $0 + $1.feeling.score })
        }.eraseToAnyPublisher()
    }()
}

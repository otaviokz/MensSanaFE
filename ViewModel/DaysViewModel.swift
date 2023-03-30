//
//  DaysViewModel.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 30/03/2023.
//

import Combine
import SwiftUI

class DaysViewModel: ObservableObject {
    private var days: [Day] = []
    @Published private(set) var visibleDays: [Day] = []
    @Published private var visibleInterval: VisibleInterval = .lastSeven
    
    func showLastWeek() {
        visibleInterval = .lastSeven
    }
    
    func showLastMonth() {
        visibleInterval = .lastThirty
    }
    
    init() {
        // Keep visible days up to date with "all" days
        visibleDaysPulisher.assign(to: &$visibleDays)
    }
    
    private lazy var visibleDaysPulisher: AnyPublisher<[Day], Never> = {
        $visibleInterval.map { self.daysTailOf(size: $0.rawValue) }.eraseToAnyPublisher()
    }()
}

// CRUD
extension DaysViewModel {
    func add(day: Day) {
        guard days.first(where: { $0.date.isSameDay(of: day.date) }) == nil else { return }
        days.append(day)
    }
    
    func remove (day: Day) {
        days.removeAll { $0 == day }
    }
    
    func daysTailOf(size: Int) -> [Day] {
        guard days.count > size else { return days }
        let count = days.count
        return Array(days[count - size..<count])
    }
    
//    var lastSevenDays: [Day] {
//        guard days.count > 7 else { return days }
//        let size = days.count
//        return Array(days[size - 7..<size]).orderedByDate
//    }
//    
//    var lastThirtyDays: [Day] {
//        guard days.count > 30 else { return days }
//        let size = days.count
//        return Array(days[size - 30..<size]).orderedByDate
//    }
}

extension DaysViewModel: ViewModelType {
    func onAppear() {
        //fetchDays
        days = PreviewContent.days
        visibleInterval = .lastSeven
    }
}

enum VisibleInterval: Int {
    case lastSeven = 7
    case lastThirty = 30
}

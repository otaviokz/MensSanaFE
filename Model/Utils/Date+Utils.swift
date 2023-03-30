//
//  Date+Utils.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 30/03/2023.
//

import Foundation

extension Date {
    func isSameDay(of date: Date) -> Bool {
        let calendar = Calendar.current
        let lc = calendar.dateComponents([.day, .month, .year], from: self)
        let rc = calendar.dateComponents([.day, .month, .year], from: date)
        
        return lc.year == rc.year && lc.month == rc.month && lc.day == rc.day
    }
}

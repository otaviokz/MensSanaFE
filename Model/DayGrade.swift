//
//  File.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 29/03/2023.
//

import Foundation

enum DayGrade: String  {
    case dreadfull = "Dreadfull"
    case poor = "Poor"
    case indiferent = "Indiferent"
    case fine = "Fine"
    case exceptional = "Exceptional"
    
    init(_ sum: Int) {
        switch sum {
        case 4...5: self = .exceptional
        case 2...3: self = .fine
        case -1...1: self = .indiferent
        case (-3)...(-2): self = .poor
        case (-5)...(-4): self = .dreadfull
        default: self = .indiferent
        }
    }
    
    init(_ entries: [JournalEntry]) {
        let sum = entries.reduce(0) { sum, entry in
            sum + entry.feeling.score
        }
        self.init(sum)
    }
    
    var starCount: Int {
        switch self {
        case .exceptional: return 5
        case .fine: return 4
        case .indiferent: return 3
        case .poor: return 2
        case .dreadfull: return 1
        }
    }
}

import SwiftUI
import UIKit

enum Feeling: String, Codable, CaseIterable {
    case anger
    case anxiety
    case awkwardness
    case boredom
    case calmness
    case confusion
    case disgust
    case excitement
    case fear
    case fun
    case happiness
    case helplessness
    case sadness
    case joy
    case unknown
    
    var colour: Color {
        Color(rawValue)
    }
    
    var score: Int {
        switch self {
        case .calmness, .excitement, .fun, .happiness, .joy: return 1
        case .unknown: return 0
        default: return -1
        }
    }
}


//
//  DiaryEntry .swift
//  MensSana
//
//  Created by Otávio Zabaleta on 26/03/2023.
//

import Foundation
import Combine
import SwiftUI

public class JournalEntry: Codable {
    let title: String
    let notes: String?
    let feeling: Feeling
    let place: String?
    let peoplePresent: [String]?
    let activity: String?
    
    init(
        _ title: String,
        notes: String? = nil,
        feeling: Feeling,
        place: String? = nil,
        peoplePresent: [String] = [],
        activity: String? = nil
    ) {
        self.title = title
        self.notes = notes
        self.feeling = feeling
        self.place = place
        self.peoplePresent = peoplePresent
        self.activity = activity
    }
}

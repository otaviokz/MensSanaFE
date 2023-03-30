//
//  JournalEntryRectangle.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 30/03/2023.
//

import SwiftUI

struct JournalEntryRectangle: View {
    let entry: JournalEntry
    
    var body: some View {
        Text("\(entry.feeling.rawValue)")
            .font(.body).fontWeight(.bold)
            .lineLimit(3)
            .minimumScaleFactor(0.75)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 8)
            .foregroundColor(Color.white.opacity(1))
            .frame(maxHeight: .infinity)
//            .frame(maxWidth: .infinity)
            .background(entry.feeling.colour)
    }
}

struct JournalEntryRectangle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            JournalEntryRectangle(entry: JournalEntry.init("Some Entry", feeling: .fun))
        }
        
    }
}

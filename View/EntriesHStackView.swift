//
//  SwiftUIView.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 30/03/2023.
//

import SwiftUI

struct EntriesHStackView: View {
    let day: Day
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            HStack(spacing: 0) {
                if day.goodEntries.count > 0 {
                    Image("arrow_up")
                        .resizable()
                        .frame(width: 12, height: 20)
                        .scaledToFill()
                        .padding(.horizontal, 4)
                        .padding(.leading, 2)
                        .foregroundColor(Feeling.happiness.colour)
                }
                ForEach(day.goodEntries) { entry in
                    JournalEntryRectangle(entry: entry)
                }
            }
            .frame(maxHeight: 80)
            .border(Color.pink.opacity(1), width: 2)
            
            HStack(spacing: 0) {
                if day.badEntries.count > 0 {
                    Image("arrow_down")
                        .resizable()
                        .frame(width: 12, height: 20)
                        .scaledToFill()
                        .padding(.horizontal, 4)
                        .padding(.leading, 2)
                        .foregroundColor(Feeling.anger.colour)
                }
                ForEach(day.badEntries) { entry in
                    JournalEntryRectangle(entry: entry)
                }
            }
            .border(Color.black.opacity(1), width: 2)
            .frame(maxHeight: 80)
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        
    }
}

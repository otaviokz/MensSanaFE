//
//  WeeklyChartView.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 30/03/2023.
//

import SwiftUI
import Combine

struct WeeklyChartView: View {
    
    @ObservedObject var viewModel = DaysViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.visibleDays) { day in
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .center, spacing: 0) {
                        Spacer()
                        Text("\(day.dateString)")
                            .font(.headline)
                            .padding(.vertical, 8)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(backgrounColor(day: day).opacity(0.5))
                    .padding(.vertical, 0.5)
                    
                    HStack(alignment: .center, spacing: 0) {
                        Spacer()
                        Text("\(day.grade.rawValue)")
                            .font(.headline)
                            .padding(.bottom, 8)
                        DayGradeStars(grade: day.grade)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(backgrounColor(day: day).opacity(0.5))
                    Spacer()
                        .frame(height: 2)
                        .frame(maxWidth: .infinity)
                        
                    VStack(alignment: .leading) {
                        ForEach(day.entries.orderedPositiveFirst) { entry in
                            HStack {
                                Text("\(entry.feeling.rawValue)")
                                    .foregroundColor(entry.feeling.colour)
                                Spacer()
                            }
                            
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.black.opacity(0.075))
                    
                }
                .frame(maxHeight: .infinity)
                .padding(.bottom, 12)
            }
        }
        .listStyle(.grouped)
        .onAppear {
            viewModel.onAppear()
        }.navigationTitle("Last 7 days")
    }
    
    func backgrounColor(day: Day) -> Color {
        switch day.grade.starCount {
        case 1: return Feeling.helplessness.colour
        case 2: return Feeling.sadness.colour
        case 3: return Feeling.calmness.colour
        case 4: return Feeling.happiness.colour
        default: return Feeling.excitement.colour
        }
    }
}

struct WeeklyChartView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyChartView()
    }
}

//
//  DayGradeStars.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 30/03/2023.
//

import SwiftUI

struct DayGradeStars: View {
    let grade: DayGrade
    var body: some View {
        HStack {
            Group {
                switch grade.starCount {
                case 5:
                    Image("five_star").resizable()
                case 4:
                    Image("four_star").resizable()
                case 3:
                    Image("three_star").resizable()
                case 2:
                    Image("two_star").resizable()
                case 1:
                    Image("star").resizable()
                default:
                    EmptyView()
                }
            }
            .frame(width: 20 * CGFloat(grade.starCount), height: 20)
            .scaledToFill()
            .foregroundColor(Color("gold"))
        }
    }
}

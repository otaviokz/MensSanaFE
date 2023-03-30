//
//  ContentView.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 26/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WeeklyChartView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  MensSana
//
//  Created by Otávio Zabaleta on 26/03/2023.
//

import SwiftUI

struct ContentView: View {
    let days: [Day]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(days: PreviewContent().days)
    }
}

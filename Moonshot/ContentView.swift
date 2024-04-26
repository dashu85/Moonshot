//
//  ContentView.swift
//  Moonshot
//
//  Created by Marcus Benoit on 18.04.24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGridView = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGridView {
                    GridLayoutView(missions: missions, astronauts: astronauts)
                } else {
                    ListLayoutView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(showingGridView ? "ListView" : "GridView") {
                    showingGridView.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

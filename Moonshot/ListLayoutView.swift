//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Marcus Benoit on 26.04.24.
//

import SwiftUI

struct ListLayoutView: View {
    let missions: [Mission]
    let astronauts: [String:Astronaut]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack(alignment: .top) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        .background(Color.darkBackground)
    }
}

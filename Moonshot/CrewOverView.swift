//
//  CrewOverView.swift
//  Moonshot
//
//  Created by Marcus Benoit on 25.04.24.
//

import SwiftUI

struct CrewOverView: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(crew, id: \.role) { member in
                    NavigationLink {
                        AstronautView(astronaut: member.astronaut)
                    } label: {
                        Text("\(member.astronaut.name)")
                    }
                }
            }
        }
    }
}

//#Preview {
//    let crew: [MissionView.CrewMember]
//    
//    return CrewOverView(crew: init().crew)
//        .preferredColorScheme(.dark)
//}

//
//  MissionView.swift
//  Moonshot
//
//  Created by Marcus Benoit on 24.04.24.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                
                Text("Launch date: \(mission.formattedLaunchDate)")
                    .padding()
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
//                    Text("Crew")
//                        .font(.title.bold())
//                        .padding(.bottom, 5)
                    
                    NavigationLink {
                        CrewOverView(crew: crew)
                        
                    } label: {
                        HStack {
                            Image(systemName: "person.3.fill")
                            
                            Text("Crew members")
                        }
                        .font(.title)
                        .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal)
                    
                    
                  // scrollable horizontal view to navigate to astronaut detail view - replaced by extra view challenge 2
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(crew, id: \.role) { crewMember in
//                            NavigationLink {
//                                AstronautView(astronaut: crewMember.astronaut)
//                            } label: {
//                                HStack {
//                                    Image(crewMember.astronaut.id)
//                                        .resizable()
//                                        .frame(width: 104, height: 72)
//                                        .clipShape(.capsule)
//                                        .overlay(
//                                            Capsule()
//                                                .strokeBorder(.white, lineWidth: 1)
//                                        )
//                                }
//
//                                VStack(alignment: .leading) {
//                                    Text(crewMember.astronaut.name)
//                                        .foregroundStyle(.white)
//                                        .font(.headline)
//                                    Text(crewMember.role)
//                                        .foregroundStyle(.white.opacity(0.5))
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
//                }
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    
    init(mission: Mission, astronauts: [String:Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let mission: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: mission[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}

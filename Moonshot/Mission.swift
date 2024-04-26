//
//  Mission.swift
//  Moonshot
//
//  Created by Marcus Benoit on 23.04.24.
//

import Foundation
import SwiftUI

struct Mission: Codable, Identifiable {
    var displayName: String {
        "Apollo \(id)"  // e.g. "Apollo 1"
    }
    
    var image: String {
        "apollo\(id)"   // e.g. "apollo1"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"  // this will format it in a way the user is used to 
    }
    
    struct CrewRole: Codable {
        let name: String    // e.g. "armstrong"
        let role: String    // e.g. "Commander"
    }
    
    let id: Int             // e.g. "1"
    let launchDate: Date?   // e.g. "1969-07-16"
    let crew: [CrewRole]    // e.g. "name: "armstrong", role: "Commander""
    let description: String // e.g. "Apollo 1, initially desi...."
}

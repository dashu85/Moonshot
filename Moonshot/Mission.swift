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
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"  // this will format it in a way the user is used to 
    }
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
}

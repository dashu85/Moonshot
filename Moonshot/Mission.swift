//
//  Mission.swift
//  Moonshot
//
//  Created by Marcus Benoit on 23.04.24.
//

import Foundation
import SwiftUI

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}

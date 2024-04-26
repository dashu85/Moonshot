//
//  Astronaut.swift
//  Moonshot
//
//  Created by Marcus Benoit on 19.04.24.
//

import Foundation
import SwiftUI

struct Astronaut: Codable, Identifiable {
    let id: String              // e.g. "armstrong"
    let name: String            // e.g. "Neil A. Armstrong"
    let description: String     // e.g. "Neil Alden Armstrong (August 5, 1930 – August 25, 2012) was an American astronaut..."
}

//
//  ContentView.swift
//  Moonshot
//
//  Created by Marcus Benoit on 18.04.24.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("printing a new custom text-")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct Examples: View {
    // GridView
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<50) {
                    Text("Item \($0)")
                }
            }
        }
        
        VStack {
            Image("Screenshot")
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
        }
        
        ScrollView(.horizontal) {   // .horizontal parameter makes the scrollview scroll horizontally
            LazyHStack {
                ForEach(0..<100) {
                    CustomText(text: "Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
        NavigationStack {
            NavigationLink {
                    Text("Detail View")
            } label: {
                VStack {
                    Text("This is the label")
                    Text("So is this")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
            .navigationTitle("SwiftUI")
        }
        
        NavigationStack {
            List(1..<10) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail: \(row)")
                }
            }
            .navigationTitle("SwiftUI2")
        }
        
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print("\(user.address.street)")
                print("\(user.address.city)")
            }
        }
    }
}

#Preview {
    Examples()
}

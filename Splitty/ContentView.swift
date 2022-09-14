//
//  ContentView.swift
//  Splitty
//
//  Created by Mahmoud Elshakoushy on 14/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                    Button("Tap Count \(tapCount)") {
                        tapCount += 1
                    }
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
            .navigationTitle("Splitty")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

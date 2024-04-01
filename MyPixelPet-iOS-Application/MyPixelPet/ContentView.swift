//
//  ContentView.swift
//  MyPixelPet
//
//  Created by Riya Arora on 2024-03-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "dog")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello PixelParent!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

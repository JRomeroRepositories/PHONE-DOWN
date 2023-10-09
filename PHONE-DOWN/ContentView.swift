//
//  ContentView.swift
//  Greetings
//
//  Created by J. Romero on 2023-10-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.cyan, .blue, .blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.85)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "iphone.gen3.slash.circle")
                    .font(.system(size: 70))
                    .colorInvert()
                    .foregroundStyle(.tint)
                    .padding()
                Text("Begin.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 30.0)
                    .padding(.vertical, 10.0)
                    .foregroundStyle(Color.white)
                    .background(Color.orange)
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .shadow(color: .orange.opacity(0.7), radius: 5, x: 5, y: 5)
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

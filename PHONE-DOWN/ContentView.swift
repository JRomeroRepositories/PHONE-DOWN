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
            
            LinearGradient(colors: 
                            [Color(red: 139/255, green: 80/255, blue: 240/255),
                             Color(red: 10/255, green: 200/255, blue: 50/255)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .opacity(0.85)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "iphone.gen3.slash.circle")
                    .font(.system(size: 70))
                    .colorInvert()
                    .foregroundStyle(.tint)
                    .padding(.bottom, -10.0)
                BigButtonView(text: "Begin.",
                           color: Color.orange)
                .padding(.bottom, -15.0)
                SmallButtonView(text: "Statistics + Sharing",
                           color: Color.orange)

            }
        }
    }
}

#Preview {
    ContentView()
}

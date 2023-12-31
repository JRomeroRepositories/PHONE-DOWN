//
//  BackgroundView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-11.
//

import SwiftUI

struct BackgroundColors: View {
    var body: some View {
        LinearGradient(colors:
                        [Color(red: 10/255, green: 80/255, blue: 240/255),
                         Color(red: 10/255, green: 230/255, blue: 25/255)],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .opacity(0.85)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundColors()
}

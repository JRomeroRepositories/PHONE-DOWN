//
//  ButtonView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-09.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        VStack {
            BigButtonView(text: text, color:color)
            SmallButtonView(text: text, color:color)
        }
    }
}

struct BigButtonView: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.horizontal, 20.0)
                .padding(.vertical, 7.0)
                .foregroundStyle(Color.white)
                .background(color)
                .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                .shadow(color: color.opacity(0.7), radius: 5, x: 5, y: 5)
            .padding()
        }
    }
}

struct SmallButtonView: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.horizontal, 12.0)
                .padding(.vertical, 7.0)
                .foregroundStyle(Color.white)
                .background(color)
                .cornerRadius(15)
                .shadow(color: color.opacity(0.7), radius: 5, x: 5, y: 5)
            .padding()
        }
    }
}

#Preview {
    BigButtonView(text: "Hello There", color: Color.blue)
    //SmallButtonView(text: "Hello There", color: Color.orange)

}

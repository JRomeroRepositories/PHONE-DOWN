//
//  LandingPageView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-11.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                BackgroundColors()
                
                VStack {
                    Image(systemName: "iphone.gen3.slash.circle")
                        .font(.system(size: 70))
                        .foregroundColor(Color("ButtonColor"))
                        .padding(.bottom, 10.0)
                    
                    NavigationLink(
                        destination: InstructionView(),
                        label: {
                            BigButtonView(text: "Begin.",
                                          color: Color("ButtonColor")) } )
                    .padding(.bottom, 7.0)
                    
                    NavigationLink(
                        destination: InstructionView(),
                        label: {
                            SmallButtonView(text: "Statistics + Sharing",
                                          color: Color("ButtonColor")) } )
                }
                .offset(y:-15)
            }
        }
    }
}


// Big buttons
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
                .shadow(color: color.opacity(0.4), radius: 5, x: 5, y: 5)
        }
    }
}

// Small Buttons
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
                .shadow(color: color.opacity(0.4), radius: 5, x: 5, y: 5)
        }
    }
}








#Preview {
    LandingPageView()
}

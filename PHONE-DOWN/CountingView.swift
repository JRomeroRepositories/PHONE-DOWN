//
//  CountingView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-11.
//


import SwiftUI

struct CountingView: View {
    let secondsElapsed : Int
    
    var body: some View {
        ZStack {
            // Black Background to save power
            Color(Color.black)
                .opacity(1)
                .ignoresSafeArea()
            
            // Show BarelyVisible Update
            VStack {
                Text(TimeNatLang(secondsElapsed:secondsElapsed))
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("BarelyVisible"))
                Text("Have elapsed")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("BarelyVisible"))
                
                Text("""
                    If you are reading this, you seek stimulation
                    in a place that offers little fulfillment.
                    Return, and complete your good work.
                    """)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("BarelyVisible"))
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CountingView(secondsElapsed: 3002)
}

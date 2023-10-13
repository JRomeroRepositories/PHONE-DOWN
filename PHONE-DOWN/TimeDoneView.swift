//
//  TimeDoneView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-11.
//

import SwiftUI

struct TimeDoneView: View {
    
    let timedone : Int
    
    var body: some View {
        // Show BarelyVisible Update
        ZStack {
            BackgroundColors()
            VStack {
                Text("Excellent Work!")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(Color("MessageColor"))
                    .padding()
                
                Text(TimeNatLang(secondsElapsed:timedone))
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("MessageColor"))
                    .padding()
                    .offset(y:-25)
                
                Text("Time well spent.")
                    .font(.title)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("MessageColor"))
                    .padding()
                    .offset(y:-35)
                
                NavigationLink(
                    destination: ShareView(),
                    label: {
                        Text("Share")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(height: 50)
                            .frame(maxWidth: 320)
                            .background(Color("ButtonColor"))
                            .cornerRadius(15) }
                    
            ) }
        }
    }
}


#Preview {
    TimeDoneView(timedone: 200)
}

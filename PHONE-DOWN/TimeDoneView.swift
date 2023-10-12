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
        VStack {
            Text("Time to celebrate!")
                .font(.title)
                .foregroundColor(Color("MessageColor"))
                .padding()
            
            Text(TimeNatLang(secondsElapsed:timedone))
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("MessageColor"))
                .padding()
            
            Text("Time well spent.")
            .font(.headline)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("MessageColor"))
            .padding()
            
            NavigationLink(
                destination: ShareView(),
                label: {
                    SmallButtonView(text: "Share",
                                    color: Color("ButtonColor")) } )

        }
    }
}


#Preview {
    TimeDoneView(timedone: 200)
}

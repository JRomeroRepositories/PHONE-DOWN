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
                BackgroundColors()
                
                VStack {
                    Image(systemName: "iphone.gen3.slash.circle")
                        .font(.system(size: 125))
                        .foregroundColor(Color("ButtonColor"))
                        .padding(.bottom, 10.0)
                    
                    NavigationLink(
                        destination: ReadyView(),
                        label: {
                            Text("Begin")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(height: 50)
                                .frame(maxWidth: 320)
                                .background(Color("ButtonColor"))
                                .cornerRadius(15)
                                .padding()
                                .offset(y:30)
                        }  )
                    
                    NavigationLink(
                        destination: StatisticsView(),
                        label: {
                            Text("Statistics + Sharing")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(height: 50)
                                .frame(maxWidth: 320)
                                .background(Color("ButtonColor"))
                                .cornerRadius(15)
                                .padding()
                            
                        } )
                    
                    NavigationLink(
                        destination: SettingsView(showSignInView: .constant(false)),
                        label: {
                            Text("Settings")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(height: 50)
                                .frame(maxWidth: 320)
                                .background(Color("ButtonColor"))
                                .cornerRadius(15)
                                .padding()
                                .offset(y:-30)
                            
                        } )
                }
                .offset(y:-15)
            }
        }
    }
}




#Preview {
    LandingPageView()
}

//
//  AuthenticationView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-12.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        
        ZStack {
            BackgroundColors()
            VStack {
                NavigationLink {
                    SignInEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Sign up with email")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .padding()
        }
    }
}


#Preview {
    AuthenticationView(showSignInView: .constant(false))
}

//
//  SignInEmailView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-12.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}


struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            BackgroundColors()
            VStack {
                Image(systemName: "iphone.gen3.slash.circle")
                    .font(.system(size: 125))
                    .foregroundColor(Color("ButtonColor"))
                    .padding(.bottom, 10.0)
                
                TextField("Email...", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .frame(height: 50)
                    .frame(maxWidth: 320)
                    .cornerRadius(15)
                    .padding()
                
                SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .frame(height: 50)
                    .frame(maxWidth: 320)
                    .cornerRadius(15)
                    .padding()
                    .offset(y:-30)
                
                Button {
                    // MARK: note that sign up and sign in can be seperate buttons based on preference
                    Task {
                        do {
                            try await viewModel.signUp()
                            showSignInView = false
                            return
                        } catch {
                            print(error)
                        }
                        
                        do {
                            try await viewModel.signIn()
                            showSignInView = false
                            return
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 50)
                        .frame(maxWidth: 320)
                        .background(Color("ButtonColor"))
                        .cornerRadius(15)
                        .padding()
                        .offset(y:-50)
                    
                }
            }
            .navigationTitle("Sign In With Email")
        }
    }
}


#Preview {
    SignInEmailView(showSignInView: .constant(false))
}

//
//  SettingsView.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-12.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        // MARK: my app should throw custom errors not generic ones
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        // MARK: need to add UI to enter the new password and email
        let emailFake = "hello123@gmail.com"
        try await AuthenticationManager.shared.updateEmail(newEmail: emailFake)
    }
    
    func updatePassword() async throws {
        // MARK: need to add UI to enter the new password and email
        let newPassword = "hello123"
        try await AuthenticationManager.shared.updatePassword(newPassword: newPassword)
    }
    
}



struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundColors()
                ScrollView {
                    Button("Log out") {
                        Task {
                            do {
                                try viewModel.signOut()
                                showSignInView = true
                            } catch {
                                print(error)
                            }
                        }
                    }
                    
                    Button("Reset Password") {
                        Task {
                            do {
                                try await viewModel.resetPassword()
                                print("Password RESET!")
                            } catch {
                                print(error)
                            }
                        }
                    }
                    
                    Button("Update Password") {
                        Task {
                            do {
                                try await viewModel.updatePassword()
                                print("Password Updated!")
                            } catch {
                                print(error)
                            }
                        }
                    }
                    
                    Button("Update Email") {
                        Task {
                            do {
                                try await viewModel.updateEmail()
                                print("Email Updated!")
                            } catch {
                                print(error)
                            }
                            Label {
                                Text("Begin")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(height: 55)
                                    .frame(maxWidth: 300)
                                    .background(Color("ButtonColor"))
                                    .cornerRadius(15)
                                    .padding()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarBackButtonHidden(false)
        }
    }
}


#Preview {
    SettingsView(showSignInView: .constant(false))
}

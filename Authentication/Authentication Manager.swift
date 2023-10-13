//
//  Authentication Manager.swift
//  PHONE-DOWN
//
//  Created by J. Romero on 2023-10-12.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}




final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() { }
    
    @discardableResult
    func createUser(email: String, password:String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail:email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    
    func getAuthenticatedUser() throws ->AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user:user)
    }
    
    @discardableResult
    func signInUser(email: String, password:String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user:authDataResult.user)
    }
    
    func resetPassword(email:String) async throws {
       try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(newPassword:String) async throws {
        guard let user = Auth.auth().currentUser else {
            // MARK: This should be a custom error
            throw URLError(.badServerResponse)
        }
        try await user.updatePassword(to: newPassword)
    }
    
    func updateEmail(newEmail:String) async throws {
        guard let user = Auth.auth().currentUser else {
            // MARK: This should be a custom error
            throw URLError(.badServerResponse)
        }
        try await user.updateEmail(to: newEmail)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
}

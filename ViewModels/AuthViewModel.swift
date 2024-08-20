//
//  AuthViewModel.swift
//  ThisPlateJoy
//
//  Created by Hanasrullah Halim on 14/08/2024.
//

import SwiftUI
import Combine
import FirebaseAuth

// Define the authentication state
enum AuthState {
    case loggedIn
    case loggingIn
    case loggedOut
}

// ViewModel to manage authentication state
class AuthViewModel: ObservableObject {
    @Published var authState: AuthState = .loggedOut
    @Published var user: User?
    @Published var error: Error?
    
    func signIn(email: String, password: String) {
        self.error = nil
        self.authState = .loggingIn
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.error = error
                self?.authState = .loggedOut // Revert to loggedOut if there's an error
                return
            }
            self?.user = result?.user
            self?.authState = .loggedIn
            
        }
    }
    
    func signOut() {
        do {
            self.error = nil
            try Auth.auth().signOut()
            self.user = nil
            self.authState = .loggedOut // Update authState to loggedOut after sign out
        } catch {
            self.error? = error
        }
    }
    
}

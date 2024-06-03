//
//  AuthViewModel.swift
//  SwiftUIAuth
//
//  Created by Abi M on 6/2/24.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {

    }
}

extension AuthViewModel {
    func signIn(withEmail email: String, password: String) async throws {
        print("Sign in..")
    }

    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        print("Create user")
    }

    func signOut() {

    }

    func deleteAccount() {

    }
}

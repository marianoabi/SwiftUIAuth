//
//  AuthViewModel.swift
//  SwiftUIAuth
//
//  Created by Abi M on 6/2/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }
}

extension AuthViewModel {
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to login with error: \(error.localizedDescription)")
        }
    }

    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            clearData()
        } catch {
            print("DEBUG: Failed to signout with error: \(error.localizedDescription)")
        }
    }

    func deleteAccount() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        do {
            try await Auth.auth().currentUser?.delete()
            try await Firestore.firestore().collection("users").document(uid).delete()
            signOut()
        } catch {
            print("DEBUG: Failed to delete user with error: \(error.localizedDescription)")
        }
    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }

    func clearData() {
        self.userSession = nil
        self.currentUser = nil
    }
}

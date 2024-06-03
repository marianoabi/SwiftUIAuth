//
//  SwiftUIAuthApp.swift
//  SwiftUIAuth
//
//  Created by Abi M on 5/31/24.
//

import SwiftUI
import Firebase

@main
struct SwiftUIAuthApp: App {
    @StateObject var viewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

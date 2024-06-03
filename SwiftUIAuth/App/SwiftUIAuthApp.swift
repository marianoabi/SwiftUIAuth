//
//  SwiftUIAuthApp.swift
//  SwiftUIAuth
//
//  Created by Abi M on 5/31/24.
//

import SwiftUI

@main
struct SwiftUIAuthApp: App {
    @StateObject var viewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

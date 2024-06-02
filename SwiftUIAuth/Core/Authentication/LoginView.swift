//
//  LoginView.swift
//  SwiftUIAuth
//
//  Created by Abi M on 5/31/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            VStack {

                // image
                Image("firebase-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 32)

                // form fields
                VStack(alignment: .leading) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .textInputAutocapitalization(.none)

                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)

                // sign in button
                Button(action: {
                    print("Sign in button tapped")
                }, label: {

                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)

                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                })
                .background(Color(.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 24)

                Spacer()

                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Don't have an account")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

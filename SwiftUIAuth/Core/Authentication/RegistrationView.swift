//
//  RegistrationView.swift
//  SwiftUIAuth
//
//  Created by Abi M on 6/2/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
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

                InputView(text: $fullName,
                          title: "Full Name",
                          placeholder: "Enter your name")

                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)

                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecureField: true)
            }

            // registration button
            Button(action: {
                print("Signup button tapped")
            }, label: {

                HStack {
                    Text("SIGN UP")
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

            Button(action: {
                dismiss()
            }, label: {
                HStack {
                    Text("Already have an account")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            })
        }
        .padding()
    }
}

#Preview {
    RegistrationView()
}

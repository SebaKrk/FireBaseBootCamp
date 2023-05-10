//
//  SignInEmailView.swift
//  FireBaseBootCamp
//
//  Created by Sebastian Sciuba on 09/05/2023.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("no email and passowrd found")
            return
        }
        /// moge tak
       // let returnuserData = try await AuthenticationManager.sherd.creatuser(email: email, password: password)
        /// albo tak dzieki   @discardableResult
        try await AuthenticationManager.sherd.creatuser(email: email, password: password)
      }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("no email and passowrd found")
            return
        }
        try await AuthenticationManager.sherd.signInUser(email: email, password: password)
      }
    
    
}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            TextField("email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print("error: \(error.localizedDescription)")
                    }
                    
                    
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print("error: \(error.localizedDescription)")
                    }
                }
                
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
            
        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignInEmailView(showSignInView: .constant(false))
    }
}

//
//  SettingsView.swift
//  FireBaseBootCamp
//
//  Created by Sebastian Sciuba on 09/05/2023.
//

import SwiftUI

@MainActor
final class SettingViewModel: ObservableObject {
    
    func logOut() throws {
        try AuthenticationManager.sherd.signOut()
    }
    
    func resetPassword() async throws {
        /// duzy skrot odosnie emaila
        let authuser = try AuthenticationManager.sherd.getAuthenticationUser()
        guard let email = authuser.emial else {
            throw URLError(.fileDoesNotExist)
        } /// to tak nie powinno wygladac tylko na potrzeby szkolenia
        
        try await AuthenticationManager.sherd.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "hello123@test.com" /// na potrzeby kursu
        try await AuthenticationManager.sherd.updateEmail(email: email)
        
    }
    
    func updatePassword() async throws {
        let password = "654321" /// na potrzeby kursu
        try await AuthenticationManager.sherd.updatePassword(password: password)
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.logOut()
                        showSignInView = true
                    } catch {
                        print("error \(error.localizedDescription)")
                    }
                }
            }
            emailSection
            
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignInView: .constant(false))
        }
    }
}

extension SettingsView {
    private var emailSection: some View {
        
        Section {
            Button("Reset password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("password Reset")
                    } catch {
                        print("error \(error.localizedDescription)")
                    }
                }
            }
            
            Button("uppdate password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("password uppdate")
                    } catch {
                        print("error \(error.localizedDescription)")
                    }
                }
            }
            
            Button("uppdate email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("email uppdate")
                    } catch {
                        print("error \(error.localizedDescription)")
                    }
                }
            }
        } header: {
            Text("email section")
        }
    }
}

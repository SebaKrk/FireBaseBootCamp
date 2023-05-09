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

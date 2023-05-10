//
//  RootView.swift
//  FireBaseBootCamp
//
//  Created by Sebastian Sciuba on 09/05/2023.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    var body: some View {
        
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }
            .onAppear {
                let authuser = try? AuthenticationManager.sherd.getAuthenticationUser()
                self.showSignInView = authuser == nil
            }
            .fullScreenCover(isPresented: $showSignInView) {
                NavigationStack {
                    AuthenticationView(showSignInView: $showSignInView)
                }
            }
        }

    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

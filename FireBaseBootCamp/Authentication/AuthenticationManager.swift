//
//  AuthenticationManager.swift
//  FireBaseBootCamp
//
//  Created by Sebastian Sciuba on 09/05/2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let emial: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.emial = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    
    static let sherd = AuthenticationManager()
    private init() { }
    
    
    func getAuthenticationUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
            /// tu ocyzwiscie powinien byc jakis innny error
        }
        return AuthDataResultModel(user: user)
    }
    func creatuser(email: String, password: String) async throws  -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws{
        try Auth.auth().signOut()
    }
    
}

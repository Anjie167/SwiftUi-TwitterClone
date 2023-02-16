//
//  User.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/12/23.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username, fullname, profileImageUrl, email: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id 
    }
}

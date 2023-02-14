//
//  User.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/12/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username, fullname, profileImageUrl, email: String
    
    
}

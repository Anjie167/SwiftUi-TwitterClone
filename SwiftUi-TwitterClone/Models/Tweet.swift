//
//  Tweet.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/14/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption, uid: String
    let timestamp: Timestamp
    var likes: Int

    var user: User?
}

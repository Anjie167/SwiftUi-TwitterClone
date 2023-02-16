//
//  UserService.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/12/23.
//


import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapShot, _ in
                guard let snapShot = snapShot else { return }
                guard let user = try? snapShot.data(as: User.self) else { return }
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void){
        Firestore.firestore().collection("users").getDocuments { snapshot, _ in
            guard let documents = snapshot else { return }
            let users = documents.documents.compactMap({try? $0.data(as: User.self)})
                        
            completion(users)
        }
    }
}

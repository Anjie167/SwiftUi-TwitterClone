//
//  ExploreViewModel.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/13/23.
//

import Foundation
class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    @Published var searchText = ""

    let service = UserService()
    
    var searchableUsers: [User] {
        if(searchText.isEmpty){
            return users
        }else{
            let lowercaseQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercaseQuery) ||
                $0.fullname.contains(lowercaseQuery)
            })
        }
    }
    
    init(){
        FetchUsers()
    }
    
    func FetchUsers(){
        service.fetchUsers{ users in
            self.users = users
        }
    }
    
    func filterArray(){

    }
}


//
//  ProfileViewModel.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/14/23.
//

import Foundation

class ProfileViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    let service = TweetsService()
    let user: User
    
    init(user: User){
        self.user = user
        fetchUserTweets()
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid){ tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
}

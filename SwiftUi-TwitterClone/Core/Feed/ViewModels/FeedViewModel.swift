//
//  FeedViewModel.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/14/23.
//

import Foundation

class FeedViewModel: ObservableObject{
    let service = TweetsService()
    let userService = UserService()
    @Published var tweets = [Tweet]()
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        service.fetchTweets{ tweets in
            self.tweets = tweets
            
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                self.userService.fetchUser(withUid: uid){ user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}

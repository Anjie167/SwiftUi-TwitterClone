//
//  TweetRowViewVM.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/15/23.
//

import Foundation


class TweetRowViewModel: ObservableObject{
    @Published var tweet: Tweet
    private let service = TweetsService()
    
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet(){
        service.likeTweet(tweet){
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet(){
        service.unlikeTweet(tweet){
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet){ didLike in
            if didLike{
                self.tweet.didLike = true
            }
        }
    }
}

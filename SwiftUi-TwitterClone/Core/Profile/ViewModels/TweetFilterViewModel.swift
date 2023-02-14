//
//  TweetFilterViewModel.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/9/23.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}

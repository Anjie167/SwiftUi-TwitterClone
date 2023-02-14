//
//  UploadTweetsViewModel.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/14/23.
//

import Foundation

class UploadTweetsViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetsService()
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption){ success in
            if success {
                self.didUploadTweet = true
            }else {
                
            }
        }
    }
}

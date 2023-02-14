//
//  TweetsRowView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/9/23.
//

import SwiftUI
import Kingfisher

struct TweetsRowView: View {
    let tweet: Tweet
    var body: some View {
        VStack(alignment: .leading){
            if let user = tweet.user {
                
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56,height: 56)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2W")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                
            }
            HStack{
                Button{
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()

                Button{
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()

                Button{
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                
                
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

//struct TweetsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsRowView()
//    }
//}

//
//  FeeView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/9/23.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets){ tweet in
                        TweetsRowView(tweet: tweet)
                            .padding()
                    }
                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 30, height: 30)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView){
                NewTweetsView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

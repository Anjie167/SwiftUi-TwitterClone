//
//  ProfileView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/9/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject var viewModel: ProfileViewModel

    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    
        init(user: User){
        viewModel = ProfileViewModel(user: user)
    }
    

    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(user: <#T##User#>)
//    }
//}


extension ProfileView{
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
            .ignoresSafeArea()
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -4)
                }
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                    .offset(x:16, y: 24)
            }
        }.frame(height: 96)
    }
    
    var actionButtons: some View{
        HStack{
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View{
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2)
                    .bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your mums favortite villan")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Gotham, NY")
                }
                HStack{
                    Image(systemName: "link")
                    
                    Text("www.theJoke.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            UserStatsView()
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue){ i in
                VStack{
                    Text(i.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == i ? .semibold : .regular)
                        .foregroundColor(selectedFilter == i ? .black : .gray)
                    
                    if selectedFilter == i {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = i
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView{
            LazyVStack{
                ForEach(viewModel.tweets(forFilter: self.selectedFilter)){ i in
                    TweetsRowView(tweet: i)
                        .padding()
                }
            }
        }

    }
}

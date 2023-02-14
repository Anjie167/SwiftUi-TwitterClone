//
//  NewTweetsView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/10/23.
//

import SwiftUI
import Kingfisher

struct NewTweetsView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State private var caption: String = ""

    var body: some View {
        VStack{
            HStack{
                Button{
                    presentationMode.wrappedValue.dismiss()
                }
            label: {
                Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                
            }
                Spacer()
                
                Button{
                    viewModel.uploadTweet(withCaption: caption)
                }
            label: {
                Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                }
            }.padding()
            
            HStack(alignment: .top){
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height:32)
                        .clipShape(Circle())
                }
                    
                    TextArea("What's Happening", text: $caption)
            
            }.padding()
        }
        .onReceive(viewModel.$didUploadTweet){ success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetsView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetsView()
    }
}

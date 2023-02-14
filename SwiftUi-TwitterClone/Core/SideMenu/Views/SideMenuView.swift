//
//  SideMenuView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/9/23.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack (alignment: .leading, spacing: 32){
            if let user = viewModel.currentUser {
                VStack(alignment: .leading){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4){
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                    
                    
                }.padding(.leading)

                ForEach(SideMenuViewModel.allCases, id: \.rawValue){ i in
                    
                    if i == .profile {
                        NavigationLink{
                            ProfileView(user: user)
                        } label: {
                            SideMenuRowView(i: i)
                        }
                    }
                    else if i == .logout {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SideMenuRowView(i: i)
                        }
                    } else {
                        SideMenuRowView(i: i)
                    }
                   
                }

            }
            else {
                ForEach(SideMenuViewModel.allCases, id: \.rawValue){ i in
                    
                    if i == .profile {
                        
                    }else if i == .logout {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SideMenuRowView(i: i)
                        }
                    } else {
                        SideMenuRowView(i: i)
                    }
                   
                }
            }

            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

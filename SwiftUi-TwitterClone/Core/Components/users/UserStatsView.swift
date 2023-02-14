//
//  UserStatsView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/9/23.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("487")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
            }
            HStack{
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("Followers")
                    .font(.caption)
            }
        }.padding(.vertical)
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}

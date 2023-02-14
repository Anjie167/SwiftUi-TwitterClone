//
//  SideMenuRowView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/9/23.
//

import SwiftUI

struct SideMenuRowView: View {
    
    var i: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: i.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(i.title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(i: .profile)
    }
}

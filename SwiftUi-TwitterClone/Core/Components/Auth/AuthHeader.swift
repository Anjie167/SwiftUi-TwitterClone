//
//  AuthHeader.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/10/23.
//

import SwiftUI

struct AuthHeaderView: View {
    let t1, t2: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{Spacer()}
            Text(t1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(t2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: .bottomRight))
        
    }
}

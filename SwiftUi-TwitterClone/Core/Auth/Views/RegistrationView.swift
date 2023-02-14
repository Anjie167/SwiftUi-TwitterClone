//
//  RegistrationView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userName: String = ""
    @State private var fullName: String = ""
    @EnvironmentObject var viewModel: AuthViewModel

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            VStack{
                AuthHeaderView(t1: "Get Started", t2: "Create your Account")
                
                VStack(spacing: 40){
                    CustomInputField(imageName: "envelope", placeholder: "Email", text: $email)
                    CustomInputField(imageName: "person", placeholder: "Username", text: $userName)
                    CustomInputField(imageName: "person", placeholder: "Full name", text: $fullName)
                    CustomInputField(imageName: "lock", placeholder: "Password", isSecureField: true, text: $password
                    )
                    
                    
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 44)
                
                Button{
                    viewModel.register(withEmail: email, password: password, fullname: fullName, username: userName)
                }label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }.shadow(color: .gray.opacity(0.3), radius: 0.5, x: 0, y: 5)
                
                
                Spacer()
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    HStack {
                        Text("Already have account?")
                            .font(.footnote)
                        
                        Text("Sign in")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom, 32)
                    
                    
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

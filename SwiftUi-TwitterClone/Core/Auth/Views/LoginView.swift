//
//  LoginView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/10/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        VStack{
            
            AuthHeaderView(t1: "Hello", t2: "Welcome Back")
            VStack(spacing: 40){
                CustomInputField(imageName: "envelope", placeholder: "Email", text: $email)
                
                CustomInputField(
                    imageName: "lock",
                    placeholder: "Password",
                    isSecureField: true,
                    text: $password
                )
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                NavigationLink{
                    
                }label: {
                    Text("Forgot password ? ")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
                
            }

            Button{
                viewModel.login(withEmail: email, password: password)
            }label: {
            Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 340, height: 50)
                .background(Color(.systemBlue))
                .clipShape(Capsule())
        }.shadow(color: .gray.opacity(0.3), radius: 0.5, x: 0, y: 5)
            
            
            Spacer()
            
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have account?")
                        .font(.footnote)
                    
                    Text("Sign up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

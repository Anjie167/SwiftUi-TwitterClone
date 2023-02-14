//
//  ProfilePhotoSelectorView.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/11/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var profileImage: Image?
    @State private var selectedImage: UIImage?
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            AuthHeaderView(
                t1: "Setup account",
                t2: "Add a profile photo"
            )
            
            Button{
                showImagePicker.toggle()
            }label: {
                if let image = profileImage {
                    image
                        .resizable()
                        .modifier(ProfileImageModifier())
                }else{
                    Image("Plus_photo")
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)

            if let selectedImage = selectedImage {
                Button{
                    viewModel.uploadProfileImage(selectedImage)
                }label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }.shadow(color: .gray.opacity(0.3), radius: 0.5, x: 0, y: 5)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else {
            return
        }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
    content
            .foregroundColor(Color(.systemBlue))
            .scaledToFit()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

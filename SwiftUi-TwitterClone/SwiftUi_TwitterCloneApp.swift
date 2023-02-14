//
//  SwiftUi_TwitterCloneApp.swift
//  SwiftUi-TwitterClone
//
//  Created by FAVOUR ANJOLA on 2/9/23.
//

import SwiftUI
import FirebaseCore


@main
struct SwiftUi_TwitterCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(viewModel)

        }
    }
}

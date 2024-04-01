//
//  ProfileView.swift
//  MyPixelPet
//
//  Created by Riya Arora on 2024-03-19.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: AuthDataResultModel? = nil
    
    func loadCurrentUser() throws {
        self.user = try AuthenticationManager.shared.getAuthenticatedUser()
        
    }
}

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background image
                Image("PixelPet2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    NavigationLink(destination: Readview()) {
                        Text("Click to Navigate to PixelPet Stats!")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom, 233)
                            .offset(x: 48)
                    }
                }
                
                Text("You Are Logged In!") // Moved text
                    .foregroundColor(.white)
                    .font(.title)
                    .offset(y: -320) // Adjust the vertical offset
                    .fontWeight(.black)
                    .offset(x: 45)
            }
        }
        .onAppear {
            try? viewModel.loadCurrentUser()
        }
        .navigationTitle("") // Hide the default navigation title
        // .navigationBarHidden(true) // Remove this line
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    Image(systemName: "gear")
                        .font(.headline)
                }
            }
        }
    }
}






struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView(showSignInView: .constant(false))
        }
    }
}


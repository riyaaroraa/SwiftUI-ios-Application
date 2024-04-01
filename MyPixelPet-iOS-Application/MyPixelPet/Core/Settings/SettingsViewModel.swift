//
//  SettingsViewModel.swift
//  MyPixelPet
//
//  Created by Riya Arora on 2024-03-19.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}

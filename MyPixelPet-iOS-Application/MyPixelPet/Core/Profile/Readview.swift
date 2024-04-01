//
//  Readview.swift
//  MyPixelPet
//
//  Created by Riya Arora on 2024-03-20.
//

import Foundation
import SwiftUI

struct Readview: View {
    @StateObject var viewModel = ReadViewModel()
    
    var body: some View {
        ScrollView {
            Image("PoopPic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Latest PixelPet Statistics")
                    .font(.headline)
                    .padding()
                
                if let feedings = viewModel.latestFeedings {
                    Text("Feedings: \(feedings)")
                        .padding()
                }
                
                if let litterClean = viewModel.latestLitterClean {
                    Text("Litter Clean: \(litterClean)")
                        .padding()
                }
                
                if let moodScore = viewModel.latestMoodScore {
                    Text("Mood Score: \(moodScore)")
                        .padding()
                }
                
                if let petClean = viewModel.latestPetClean {
                    Text("Pet Clean: \(petClean)")
                        .padding()
                }
                
                if let steps = viewModel.latestSteps {
                    Text("Steps: \(steps)")
                        .padding()
                }
                
                if let temperature = viewModel.latestTemperature {
                    Text("Temperature: \(temperature, specifier: "%.2f")")
                        .padding()
                }
                
                // Fallback text if no data is available yet
                if viewModel.latestFeedings == nil &&
                    viewModel.latestLitterClean == nil &&
                    viewModel.latestMoodScore == nil &&
                    viewModel.latestPetClean == nil &&
                    viewModel.latestSteps == nil &&
                    viewModel.latestTemperature == nil {
                    Text("No data available. Please fetch the latest readings.")
                        .padding()
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
            .padding()
            
            Button {
                viewModel.readLatestValues()
            } label: {
                Text("Refresh")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct Readview_Previews: PreviewProvider {
    static var previews: some View {
        Readview()
    }
}

//
//  ReadViewModel.swift
//  MyPixelPet
//
//  Created by Riya Arora on 2024-03-20.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class ReadViewModel: ObservableObject {
    private var ref = Database.database().reference()
    
    @Published var latestFeedings: Int? = nil
    @Published var latestLitterClean: Int? = nil
    @Published var latestMoodScore: Int? = nil
    @Published var latestPetClean: Int? = nil
    @Published var latestSteps: Int? = nil
    @Published var latestTemperature: Double? = nil // Assuming temperature might be a Double.
    
    func readLatestValues() {
        readLatestEntry(from: "Feedings") { value in
            self.latestFeedings = value
        }
        readLatestEntry(from: "LitterClean") { value in
            self.latestLitterClean = value
        }
        readLatestEntry(from: "MoodScore") { value in
            self.latestMoodScore = value
        }
        readLatestEntry(from: "PetClean") { value in
            self.latestPetClean = value
        }
        readLatestEntry(from: "Steps") { value in
            self.latestSteps = value
        }
        readLatestEntryForTemperature(from: "Temperature") { value in
            self.latestTemperature = value
        }
    }
    
    private func readLatestEntry(from node: String, completion: @escaping (Int?) -> Void) {
        ref.child(node).queryOrderedByKey().queryLimited(toLast: 1).observeSingleEvent(of: .value) { snapshot in
            guard let children = snapshot.value as? [String: Any],
                  let lastKey = children.keys.sorted().last,
                  let lastValue = children[lastKey] as? Int else {
                completion(nil)
                return
            }
            completion(lastValue)
        }
    }
    
    // Since temperature might be a Double separate method for it.
    private func readLatestEntryForTemperature(from node: String, completion: @escaping (Double?) -> Void) {
        ref.child(node).queryOrderedByKey().queryLimited(toLast: 1).observeSingleEvent(of: .value) { snapshot in
            guard let children = snapshot.value as? [String: Any],
                  let lastKey = children.keys.sorted().last,
                  let lastValue = children[lastKey] as? Double else {
                completion(nil)
                return
            }
            completion(lastValue)
        }
    }
}

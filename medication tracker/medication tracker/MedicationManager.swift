//
//  MedicationManager.swift
//  medication tracker
//
//  Created by Zain Karim and Prethel Alam on 11/5/23.
//

import Foundation

class MedicationManager: ObservableObject {
    @Published var medications: [Medication] = [] {
        didSet {
            saveToUserDefaults()
        }
    }
    
    init() {
        loadFromUserDefaults()
    }
    
    func addMedication(_ medication: Medication) {
        medications.append(medication)
    }
    
    func removeMedication(_ medication: Medication) {
        medications.removeAll { $0.id == medication.id }
    }
    
    func editMedication(_ medication: Medication) {
        if let index = medications.firstIndex(where: { $0.id == medication.id }) {
            medications[index] = medication
        }
    }
    
    
    
    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(medications) {
            UserDefaults.standard.set(encoded, forKey: "medications")
        }
    }
    
    private func loadFromUserDefaults() {
        if let medicationsData = UserDefaults.standard.data(forKey: "medications"),
           let decoded = try? JSONDecoder().decode([Medication].self, from: medicationsData) {
            medications = decoded
        }
    }
    
    
}

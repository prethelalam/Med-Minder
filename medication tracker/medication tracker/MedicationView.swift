//
//  MedicationView.swift
//  medication tracker
//
//  Created by Zain Karim on 11/5/23.
//

import SwiftUI

struct MedicationView: View {
    @State private var name: String = ""
    @State private var dosage: String = ""
    @State private var frequency: String = ""
    @ObservedObject var manager: MedicationManager

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Medication")) {
                    TextField("Name", text: $name)
                    TextField("Dosage", text: $dosage)
                    TextField("Frequency", text: $frequency)
                }

                Button(action: addMedication) {
                    Text("Add Medication")
                }
            }
            .navigationBarTitle("Add Medication")
        }
        }

    private func addMedication() {
        let newMedication = Medication(name: name, dosage: dosage, frequency: frequency)
        manager.addMedication(newMedication)
        // Reset the fields
        name = ""
        dosage = ""
        frequency = ""
    }
}


//
//  MedicationEditView.swift
//  medication tracker
//
//  Created by Prethel Alam on 11/5/23.


// DOESN'T WORK 
//

import SwiftUI

struct MedicationEditView: View {
    @ObservedObject var manager: MedicationManager
    @Binding var medicationToEdit: Medication?

    @State private var updatedMedication: Medication

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Medication Name", text: $updatedMedication.name)
                    TextField("Dosage", text: $updatedMedication.dosage)
                    TextField("Frequency", text: $updatedMedication.frequency)
                }

                Section {
                    Button("Save Changes") {
                        if let medicationToEdit = medicationToEdit {
                            // Edit existing medication
                            manager.editMedication(updatedMedication)
                        } else {
                            // Add new medication
                            manager.addMedication(updatedMedication)
                        }

                        // Dismiss the edit view
                        medicationToEdit = nil
                    }
                }
            }
            .navigationTitle("Edit Medication")
        }
    }

    init(manager: MedicationManager, medicationToEdit: Binding<Medication?>) {
        self.manager = manager
        _medicationToEdit = medicationToEdit
        _updatedMedication = State(initialValue: medicationToEdit.wrappedValue ?? Medication())
    }
}

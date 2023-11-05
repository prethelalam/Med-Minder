//
//  MedicationListView.swift
//  medication tracker
//
//  Created by Zain Karim and Prethel Alam on 11/5/23.
//

import SwiftUI

struct MedicationListView: View {
    @ObservedObject var manager: MedicationManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(manager.medications) { medication in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(medication.name).font(.headline)
                            Text("Dosage: \(medication.dosage)")
                            Text("Frequency: \(medication.frequency)")
                        }
                    }
                }
                .onDelete(perform: deleteMedication)
            }
            .navigationTitle("My Medications")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MedicationView(manager: manager)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func deleteMedication(at offsets: IndexSet) {
        offsets.forEach { index in
            let medication = manager.medications[index]
            manager.removeMedication(medication)
        }
    }
    
//    
//    private func editMedication(at offsets: IndexSet) {
//        if let index = offsets.first {
//            let medicationToEdit = manager.medications[index]
//            
//            // Present an edit view with the selected medication
//            // You should navigate to a view where the user can edit the medication's details.
//            // For example, using a NavigationLink, sheet, or full-screen presentation, depending on your app's structure.
//            // Pass the 'medicationToEdit' to the edit view.
//        }
//    }
}

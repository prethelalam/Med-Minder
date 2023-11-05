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
}

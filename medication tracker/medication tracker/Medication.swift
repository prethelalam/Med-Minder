//
//  Medication.swift
//  medication tracker
//
//  Created by Zain Karim and Prethel Alam on 11/5/23.
//

import Foundation

struct Medication: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var dosage: String
    var frequency: String
}

//
//  medication_trackerApp.swift
//  medication tracker
//
//  Created by Zain Karim on 11/5/23.
//


//
//
//import SwiftUI
//
//@main
//struct MedicationReminderApp: App {
//    @StateObject private var medicationManager = MedicationManager()
//    @State private var isShowingMedicationList = false
//    
//    var body: some Scene {
//        WindowGroup("Testing Home Page") {
//            NavigationView {
//                VStack {
//                    Text("Welcome To Med-Minder")
//                        .font(.title)
//                        .bold()
//                        .padding(.top, 5) // Adjust the top padding as needed
//                    
//                    Image("appLogo")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 350, height: 350)
//                        .padding()
//                        .background(Color("#C3DBC5"))
//                        .ignoresSafeArea()
//                    
//                    NavigationLink("View Medications", destination: MedicationListView(manager: medicationManager))
//                }
//             
//            }
//        }
//    }
//}


import SwiftUI

@main
struct MedicationReminderApp: App {
    @StateObject private var medicationManager = MedicationManager()
    @State private var isShowingMedicationList = false
    
    var body: some Scene {
        WindowGroup("Testing Home Page") {
            NavigationView {
                VStack {
                    Text("Welcome To Med-Minder")
                        .font(.title)
                        .bold()
                        .padding(.top, 5) // Adjust the top padding as needed
                    
                    Image("appLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 350)
                        .padding()
                        .background(Color("#C3DBC5"))
                        .ignoresSafeArea()
                    
                    Button(action: {
                        // Add the action you want to perform when the button is tapped
                        // For example, you can navigate to the MedicationListView here
                        isShowingMedicationList = true
                    }) {
                        Text("View Medications")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("#426A5A"))
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $isShowingMedicationList) {
                        MedicationListView(manager: medicationManager)
                    }
                }
            }
        }
    }
}

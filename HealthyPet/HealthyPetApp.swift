//
//  HealthyPetApp.swift
//  HealthyPet
//
//  Created by Marieta Svetleva on 15/03/2026.
//

import SwiftUI
import SwiftData

@main
struct HealthyPetApp: App {
    var body: some Scene {
        WindowGroup {
            StartUpPage()
        }
        .modelContainer(for: [ShopItem.self, User.self, Pet.self, Habit.self])

    }
}

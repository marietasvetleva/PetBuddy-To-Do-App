import Foundation
import SwiftData

@Model
final class User {
    var name: String
    var totalCoins: Int
    var streak: Int
    var taskCompleted: Int
    var longestStreak: Int
    var pet: Pet?
    
    init(
        name: String,
        totalCoins: Int = 0,
        streak: Int = 0,
        taskCompleted: Int = 0,
        longestStreak: Int = 0,
        pet: Pet? = nil
        
    ) {
        self.name = name
        self.totalCoins = totalCoins
        self.streak = streak
        self.taskCompleted = taskCompleted
        self.longestStreak = longestStreak
        self.pet = pet
        
        
    }
}

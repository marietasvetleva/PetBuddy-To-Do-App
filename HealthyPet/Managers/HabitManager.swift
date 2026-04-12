import Foundation

final class HabitManager {
    
    func completeHabit(_ habit: Habit, for user: User) {
        guard !habit.isCompletedToday else { return }
        
        habit.isCompletedToday = true
        user.totalCoins += habit.coinReward
        user.taskCompleted += 1
        user.streak += 1
        
        if user.streak > user.longestStreak {
            user.longestStreak = user.streak
        }
        
        if let pet = user.pet {
            pet.energy = min(pet.energy + 5, 100)
            
            let petManager = PetManager()
            petManager.updateMood(for: pet)
        
        }
    }
}

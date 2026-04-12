import Foundation

final class ShopManager {
    
    func buyFoodBowl(for user: User) {
        guard user.totalCoins >= 10 else { return }
        
        user.totalCoins -= 10
        
        if let pet = user.pet {
            pet.energy = min(pet.energy + 10, 100)
            pet.mood = "Happy"
        }
    }
    
    func buyHealthySnack(for user: User) {
        guard user.totalCoins >= 15 else { return }
        
        user.totalCoins -= 15
        
        if let pet = user.pet {
            pet.mood = "Excited"
        }
    }
    
    func buySuperMeal(for user: User) {
        guard user.totalCoins >= 15 else { return }
        
        user.totalCoins -= 15
        
        if let pet = user.pet {
            pet.energy = min(pet.energy + 10, 100)
            
            let petManager = PetManager()
            petManager.updateMood(for: pet)
        }
        
    }
}

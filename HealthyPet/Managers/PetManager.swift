
import Foundation

final class PetManager {
    
    func updateMood(for pet: Pet) {
        if pet.energy > 70 {
            pet.mood = "Happy"
        } else if pet.energy > 30 {
            pet.mood = "Okay"
        } else {
            pet.mood = "Sad"
        }
    }
}

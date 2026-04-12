import Foundation
import SwiftData

final class UserManager {
    
    func createUserAndPet(
        userName: String,
        petName: String,
        petType: String,
        modelContext: ModelContext
    ) -> Bool {
        
        let finalUserName = userName.trimmingCharacters(in: .whitespacesAndNewlines)
        let finalPetName = petName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !finalUserName.isEmpty, !finalPetName.isEmpty else {
            return false
        }
        
        let pet = Pet(name: finalPetName, type: petType)
        let user = User(name: finalUserName, pet: pet)
        
        modelContext.insert(pet)
        modelContext.insert(user)
        
        return true
    }
}

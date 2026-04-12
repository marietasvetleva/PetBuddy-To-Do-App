import Foundation
import SwiftData

@Model
final class Pet {
    var name: String
    var type: String
    var mood: String
    var energy: Int


    init(
        name: String,
        type: String,
        mood: String = "Happy",
        energy: Int = 80
        
    
    ) {
        self.name = name
        self.type = type
        self.mood = mood
        self.energy = energy

    }
}

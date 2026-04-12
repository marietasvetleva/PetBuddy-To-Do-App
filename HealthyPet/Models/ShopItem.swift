import Foundation
import SwiftData

@Model
final class ShopItem {
    var name: String
    var price: Int
    var energyBoost: Int
    var happinessBoost: Int

    init(
        name: String,
        price: Int,
        energyBoost: Int = 0,
        happinessBoost: Int = 0
    ) {
        self.name = name
        self.price = price
        self.energyBoost = energyBoost
        self.happinessBoost = happinessBoost
    }
}

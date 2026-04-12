import Foundation
import SwiftData

@Model
final class Habit {
    var title: String
    var isCompletedToday: Bool
    var streak: Int
    var coinReward: Int

    var repeatType: String   // daily, weekly
    var reminderTime: Date?

    init(
        title: String,
        isCompletedToday: Bool = false,
        streak: Int = 0,
        coinReward: Int = 10,
        repeatType: String = "Daily",
        reminderTime: Date? = nil
    ) {
        self.title = title
        self.isCompletedToday = isCompletedToday
        self.streak = streak
        self.coinReward = coinReward
        self.repeatType = repeatType
        self.reminderTime = reminderTime
    }
}

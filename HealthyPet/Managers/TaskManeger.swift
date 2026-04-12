import Foundation
import SwiftData

final class TaskManager {
    
    func createTask(
        taskName: String,
        repeatType: String,
        reminderTime: Date,
        modelContext: ModelContext
    ) -> Bool {
        
        let finalTaskName = taskName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !finalTaskName.isEmpty else {
            return false
        }
        
        let habit = Habit(
            title: finalTaskName,
            isCompletedToday: false,
            coinReward: 10,
            repeatType: repeatType
        )
        
        modelContext.insert(habit)
        return true
    }
}

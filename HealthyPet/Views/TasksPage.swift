import SwiftUI
import SwiftData

struct TasksPage: View {
    @Query private var habits: [Habit]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.95, blue: 0.97),
                    Color(red: 0.80, green: 0.82, blue: 0.90)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 28) {
                        
                        Text("Your Tasks")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top, 30)
                        
                        VStack(spacing: 20) {
                            if habits.isEmpty {
                                Text("No tasks yet")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.black.opacity(0.7))
                                    .padding(.vertical, 30)
                            } else {
                                ForEach(habits) { habit in
                                    taskItem(
                                        emoji: emojiForHabit(habit.title),
                                        title: habit.title,
                                        repeatType: habit.repeatType,
                                        isCompleted: habit.isCompletedToday
                                    )
                                }
                            }
                        }
                        .padding(.vertical, 30)
                        .padding(.horizontal, 20)
                        .background(Color.white.opacity(0.88))
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 6)
                        
                        NavigationLink(destination: CreateTaskView()) {
                            HStack(spacing: 14) {
                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .bold))
                                
                                Text("Add a new Task")
                                    .font(.system(size: 22, weight: .medium))
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: 380)
                            .frame(height: 95)
                            .background(Color(red: 0.72, green: 0.86, blue: 0.81))
                            .cornerRadius(28)
                            .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 5)
                        }
                        .padding(.top, 18)
                        
                        Spacer(minLength: 30)
                    }
                    .padding(.horizontal, 24)
                }
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: HomePage()) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 34))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: FoodShop()) {
                        Image(systemName: "cart")
                            .font(.system(size: 34))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ProfilePage()) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 34))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 18)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func taskItem(
        emoji: String,
        title: String,
        repeatType: String,
        isCompleted: Bool
    ) -> some View {
        HStack(spacing: 14) {
            Text(emoji)
                .font(.system(size: 28))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
                
                Text(repeatType)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black.opacity(0.6))
            }
            
            Spacer()
            
            if isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 26))
                    .foregroundColor(.green)
            }
        }
        .padding(.horizontal, 24)
        .frame(minHeight: 92)
        .background(Color(red: 0.95, green: 0.88, blue: 0.84))
        .cornerRadius(24)
    }
    
    func emojiForHabit(_ title: String) -> String {
        let lowercasedTitle = title.lowercased()
        
        if lowercasedTitle.contains("water") {
            return "💧"
        } else if lowercasedTitle.contains("walk") {
            return "🏃"
        } else if lowercasedTitle.contains("meditate") || lowercasedTitle.contains("stretch") {
            return "🧘"
        } else if lowercasedTitle.contains("gym") || lowercasedTitle.contains("workout") {
            return "🏋️"
        } else if lowercasedTitle.contains("sleep") {
            return "😴"
        } else if lowercasedTitle.contains("eat") || lowercasedTitle.contains("drink") {
            return "🍎"
        } else {
            return "✅"
        }
    }
}

#Preview {
    NavigationStack {
        TasksPage()
    }
}

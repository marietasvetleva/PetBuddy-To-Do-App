import SwiftUI
import SwiftData

struct HomePage: View {
    @Query private var users: [User]
    @Query private var habits: [Habit]
    
    private let habitManager = HabitManager()
    
    var body: some View {
        let user = users.first
        
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
                    VStack(spacing: 24) {
                        
                        HStack(spacing: 16) {
                            statCard(icon: "🔥", text: "\(user?.streak ?? 0) days")
                            statCard(icon: "🪙", text: "\(user?.totalCoins ?? 0)")
                        }
                        .padding(.top, 20)
                        
                        Text("Good Morning, \(user?.name ?? "User")")
                            .font(.system(size: 34, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                        
                        if let pet = user?.pet {
                            VStack(spacing: 14) {
                                
                                Image(getPetImageName(pet: pet))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 170, height: 170)
                                
                                Text(pet.name)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Text("Mood: \(pet.mood)")
                                    Spacer()
                                    Text("Energy: \(pet.energy)%")
                                }
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 24)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(26)
                            .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 5)
                        } else {
                            VStack(spacing: 12) {
                                Text("No pet yet")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.black)
                                
                                Text("Create your pet in onboarding")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black.opacity(0.7))
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 24)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(26)
                            .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 5)
                        }
                        
                        VStack(spacing: 22) {
                            if habits.isEmpty {
                                Text("No habits yet")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.black.opacity(0.7))
                                    .padding()
                            } else {
                                ForEach(habits) { habit in
                                    taskRow(
                                        emoji: emojiForHabit(habit.title),
                                        title: habit.title,
                                        isDone: habit.isCompletedToday,
                                        action: {
                                            if let user {
                                                habitManager.completeHabit(habit, for: user)
                                            }
                                        }
                                    )
                                }
                            }
                        }
                        .padding(18)
                        .background(Color.white.opacity(0.88))
                        .cornerRadius(28)
                        
                        Spacer(minLength: 20)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: TasksPage()) {
                        navIcon(systemName: "checkmark.square")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: FoodShop()) {
                        navIcon(systemName: "cart")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ProfilePage()) {
                        navIcon(systemName: "person.crop.circle")
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 18)
                .background(Color.clear)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func getPetImageName(pet: Pet) -> String {
        let type = pet.type.lowercased()
        let mood = pet.mood.lowercased()
        
        if mood.contains("sad") {
            return "\(type)_sad"
        } else {
            return "\(type)_happy"
        }
    }
    
    func statCard(icon: String, text: String) -> some View {
        HStack(spacing: 14) {
            Text(icon)
                .font(.system(size: 28))
            
            Text(text)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color(red: 0.75, green: 0.78, blue: 0.90))
        .cornerRadius(24)
    }
    
    func navIcon(systemName: String) -> some View {
        Image(systemName: systemName)
            .font(.system(size: 34))
            .foregroundColor(.black)
    }
    
    func taskRow(
        emoji: String,
        title: String,
        isDone: Bool,
        action: @escaping () -> Void
    ) -> some View {
        HStack {
            Text(emoji)
                .font(.system(size: 30))
            
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black.opacity(0.7), lineWidth: 2)
                        .frame(width: 40, height: 40)
                    
                    if isDone {
                        Image(systemName: "checkmark")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 20)
        .background(Color(red: 0.70, green: 0.86, blue: 0.80))
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.12), radius: 5, x: 0, y: 5)
    }
    
    func emojiForHabit(_ title: String) -> String {
        let lowercasedTitle = title.lowercased()
        
        if lowercasedTitle.contains("walk") {
            return "🚶"
        } else if lowercasedTitle.contains("stretch") {
            return "🧘"
        } else if lowercasedTitle.contains("water") {
            return "💧"
        } else if lowercasedTitle.contains("sleep") {
            return "😴"
        } else if lowercasedTitle.contains("run") {
            return "🏃"
        } else {
            return "✅"
        }
    }
}

#Preview {
    NavigationStack {
        HomePage()
    }
}

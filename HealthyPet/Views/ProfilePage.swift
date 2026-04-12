import SwiftUI
import SwiftData

struct ProfilePage: View {
    @Query private var users: [User]
    
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
                        
                        Text("Profile")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.top, 30)
                        
                        VStack(spacing: 22) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height: 110)
                                .foregroundColor(.black)
                                .padding(.top, 16)
                            
                            VStack(spacing: 16) {
                                profileInfoCard(title: "Name:", value: user?.name ?? "-")
                                profileInfoCard(title: "Streak:", value: "\(user?.streak ?? 0)")
                                profileInfoCard(title: "Task Completed:", value: "\(user?.taskCompleted ?? 0)")
                                profileInfoCard(title: "Longest Streak:", value: "\(user?.longestStreak ?? 0)")
                            }
                            .padding(.bottom, 20)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .background(Color.white.opacity(0.88))
                        .cornerRadius(28)
                        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 6)
                        
                        if let pet = user?.pet {
                            VStack(spacing: 10) {
                                Text("Your Pet")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.black)
                                
                                Text("Name: \(pet.name)")
                                    .font(.system(size: 18, weight: .medium))
                                
                                Text("Type: \(pet.type)")
                                    .font(.system(size: 18, weight: .medium))
                                
                                Text("Mood: \(pet.mood)")
                                    .font(.system(size: 18, weight: .medium))
                                
                                Text("Energy: \(pet.energy)%")
                                    .font(.system(size: 18, weight: .medium))
                            }
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white.opacity(0.88))
                            .cornerRadius(28)
                            .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 6)
                        }
                        
                        Spacer(minLength: 30)
                    }
                    .padding(.horizontal, 24)
                }
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: HomePage()) {
                        navIcon(systemName: "house.fill")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: TasksPage()) {
                        navIcon(systemName: "checkmark.square")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: FoodShop()) {
                        navIcon(systemName: "cart")
                    }
                    
                                    
                    Spacer()
                }
                .padding(.vertical, 18)
            }
        }
        
    }
    
    func profileInfoCard(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black)
        }
        .padding(.horizontal, 18)
        .frame(height: 52)
        .background(Color(red: 0.95, green: 0.88, blue: 0.84))
        .cornerRadius(18)
    }
    
    func navIcon(systemName: String) -> some View {
        Image(systemName: systemName)
            .font(.system(size: 34))
            .foregroundColor(.black)
    }
}

#Preview {
    NavigationStack {
        ProfilePage()
    }
}

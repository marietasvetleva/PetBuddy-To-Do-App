//
//  HomePage.swift
//  HealthyPet
//
//  Created by Marieta Svetleva on 09/04/2026.
//

import SwiftUI

struct HomePage: View {
    @State private var walkDone = false
    @State private var stretchDone = false
    
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
                    VStack(spacing: 24) {
                        
                        HStack(spacing: 16) {
                            statCard(icon: "🔥", text: "5 days")
                            statCard(icon: "", text: "100")
                        }
                        .padding(.top, 20)
                        
                        Text("Good Morning, Marieta")
                            .font(.system(size: 34, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                        
                        HStack {
                            Text("Mood: Happy")
                            Spacer()
                            Text("Energy: 80%")
                        }
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
                        .padding(.horizontal, 36)
                        .padding(.vertical, 28)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(26)
                        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 5)
                        
                        VStack(spacing: 22) {
                            taskRow(
                                emoji: "🚶",
                                title: "Walk 10 min",
                                isDone: $walkDone
                            )
                            
                            taskRow(
                                emoji: "🧘",
                                title: "Stretch",
                                isDone: $stretchDone
                            )
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
                    
                    NavigationLink(destination: Text("Profile Page")) {
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
    
    func taskRow(emoji: String, title: String, isDone: Binding<Bool>) -> some View {
        HStack {
            Text(emoji)
                .font(.system(size: 30))
            
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                isDone.wrappedValue.toggle()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black.opacity(0.7), lineWidth: 2)
                        .frame(width: 40, height: 40)
                    
                    if isDone.wrappedValue {
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
}

#Preview {
    NavigationStack {
        HomePage()
    }
}

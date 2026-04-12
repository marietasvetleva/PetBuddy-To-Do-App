//
//  TasksPage.swift
//  HealthyPet
//
//  Created by Marieta Svetleva on 09/04/2026.
//

import SwiftUI

struct TasksPage: View {
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
                        
                        VStack(spacing: 30) {
                            taskItem(text: "💧 Drink 2L of water today")
                            taskItem(text: "🏃 Walk 8000 steps")
                            taskItem(text: "🧘 Meditate for 5 minutes")
                            taskItem(text: "🍎 Avoid sugary drinks today")
                            taskItem(text: "🏋️ Go to the Gym")
                        }
                        .padding(.vertical, 40)
                        .padding(.horizontal, 28)
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
                    
                    NavigationLink(destination: Text("Profile")) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 34))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 18)
                        .padding(.vertical, 18)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            
            func taskItem(text: String) -> some View {
                HStack {
                    Text(text)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                .frame(height: 92)
                .background(Color(red: 0.95, green: 0.88, blue: 0.84))
                .cornerRadius(24)
            }
        }
        
        #Preview {
            NavigationStack {
                TasksPage()
            }
        }
    


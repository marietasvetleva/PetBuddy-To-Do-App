//
//  OnboardingPage.swift
//  HealthyPet
//
//  Created by Marieta Svetleva on 09/04/2026.
//

import SwiftUI

struct OnboardingView: View {
    @State private var userName: String = ""
    @State private var age: String = ""
    
    @State private var improveHealth = false
    @State private var reduceStress = false
    @State private var betterSleep = false
    
    @State private var selectedPet: String = "Cat"
    @State private var petName: String = ""
    
    let pets = ["Cat", "Dog", "Bunny", "Penguin"]
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.92, green: 0.93, blue: 0.98),
                    Color.white
                ],
                startPoint: .bottom,
                endPoint: .top
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    Text("Let’s personalise your\nexperience!")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    VStack(alignment: .leading, spacing: 26) {
                        
                        customTextField(title: "Your Name:", text: $userName)
                        
                        customTextField(title: "Your Age:", text: $age)
                            .keyboardType(.numberPad)
                        
                        HStack(alignment: .center, spacing: 20) {
                            Text("Goal:")
                                .font(.system(size: 22, weight: .medium))
                                .foregroundColor(.black)
                            
                            VStack(alignment: .leading, spacing: 14) {
                                goalToggle(title: "Improve Health", isOn: $improveHealth)
                                goalToggle(title: "Reduce Stress", isOn: $reduceStress)
                                goalToggle(title: "Better Sleep", isOn: $betterSleep)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(red: 0.95, green: 0.88, blue: 0.84))
                            .cornerRadius(26)
                        }
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Choose your Pet")
                                .font(.system(size: 22, weight: .medium))
                            
                            HStack(spacing: 12) {
                                petCard(emoji: "🐱", name: "Cat", bgColor: Color.green.opacity(0.18))
                                petCard(emoji: "🐶", name: "Dog", bgColor: Color.orange.opacity(0.18))
                                petCard(emoji: "🐰", name: "Bunny", bgColor: Color.purple.opacity(0.18))
                                petCard(emoji: "🐧", name: "Penguin", bgColor: Color.blue.opacity(0.15))
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Name your Pet:")
                                .font(.system(size: 22, weight: .medium))
                            
                            TextField("", text: $petName)
                                .padding()
                                .frame(height: 56)
                                .background(Color(red: 0.95, green: 0.88, blue: 0.84))
                                .cornerRadius(22)
                        }
                    }
                    .padding(22)
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(30)
                    
                    NavigationLink(destination: HomePage()) {
                        Text("Create My Pet")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 72)
                            .background(Color(red: 0.72, green: 0.90, blue: 0.87))
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.18), radius: 8, x: 0, y: 6)
                    }
                    .padding(.horizontal, 80)
                    .padding(.bottom, 30)
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
            }
        }
    }
    
    @ViewBuilder
    func customTextField(title: String, text: Binding<String>) -> some View {
        TextField(title, text: text)
            .font(.system(size: 20, weight: .medium))
            .padding(.horizontal, 20)
            .frame(height: 56)
            .background(Color(red: 0.95, green: 0.88, blue: 0.84))
            .cornerRadius(22)
    }
    
    @ViewBuilder
    func goalToggle(title: String, isOn: Binding<Bool>) -> some View {
        Toggle(isOn: isOn) {
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black)
        }
        .toggleStyle(CheckboxToggleStyle())
    }
    
    @ViewBuilder
    func petCard(emoji: String, name: String, bgColor: Color) -> some View {
        Button(action: {
            selectedPet = name
        }) {
            VStack(spacing: 6) {
                Text(emoji)
                    .font(.system(size: 30))
                
                Text(name)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.black)
            }
            .frame(width: 68, height: 78)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(bgColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                selectedPet == name ? Color.black.opacity(0.5) : Color.clear,
                                lineWidth: 2
                            )
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black.opacity(0.7), lineWidth: 1.5)
                    .frame(width: 24, height: 24)
                    .overlay {
                        if configuration.isOn {
                            Image(systemName: "checkmark")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                
                configuration.label
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        OnboardingView()
    }
}

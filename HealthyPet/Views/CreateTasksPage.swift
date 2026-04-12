//
//  CreateTasksPage.swift
//  HealthyPet
//
//  Created by Marieta Svetleva on 09/04/2026.
//

import SwiftUI

struct CreateTaskView: View {
    @State private var taskName: String = ""
    @State private var selectedRepeat = "Daily"
    @State private var reminderTime = Date()
    
    let repeatOptions = ["Daily", "Weekly", "Monthly"]
    
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
            
            VStack(spacing: 30) {
                
                Text("Create a Task")
                    .font(.system(size: 34, weight: .bold))
                
                VStack(spacing: 24) {
                    
                    TextField("Task Name:", text: $taskName)
                        .padding()
                        .frame(height: 60)
                        .background(Color(red: 0.95, green: 0.88, blue: 0.84))
                        .cornerRadius(20)
                    
                    Menu {
                        ForEach(repeatOptions, id: \.self) { option in
                            Button(option) {
                                selectedRepeat = option
                            }
                        }
                    } label: {
                        HStack {
                            Text("Repeat?")
                            Spacer()
                            Text(selectedRepeat)
                        }
                        .padding()
                        .frame(height: 60)
                        .background(Color(red: 0.95, green: 0.88, blue: 0.84))
                        .cornerRadius(20)
                    }
                    
                    HStack {
                        Text("Reminder:")
                        
                        Spacer()
                        
                        DatePicker(
                            "",
                            selection: $reminderTime,
                            displayedComponents: .hourAndMinute
                        )
                        .labelsHidden()
                        .padding(10)
                        .background(Color(red: 0.75, green: 0.78, blue: 0.90))
                        .cornerRadius(16)
                    }
                    .padding()
                    .frame(height: 60)
                    .background(Color(red: 0.95, green: 0.88, blue: 0.84))
                    .cornerRadius(20)
                }
                .padding(20)
                .background(Color.white.opacity(0.9))
                .cornerRadius(28)
                
                Button("Create!") {
                    print("Task created")
                }
                .font(.title2)
                .frame(width: 250, height: 80)
                .background(Color(red: 0.72, green: 0.86, blue: 0.81))
                .cornerRadius(24)
                .shadow(radius: 6)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    NavigationStack {
        CreateTaskView()
    }
}

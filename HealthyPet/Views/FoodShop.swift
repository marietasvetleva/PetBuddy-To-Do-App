//
//  FoodShop.swift
//  HealthyPet
//
//  Created by Marieta Svetleva on 09/04/2026.
//

import SwiftUI

struct FoodShop: View {
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
                        
                        HStack {
                            Spacer()
                            coinCard()
                        }
                        .padding(.top, 20)
                        
                        Text("Pet Shop")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.black)
                        
                        VStack(spacing: 26) {
                            shopItem(
                                imageName: "foodbowl",
                                title: "Food Bowl",
                                benefit1: "+ Energy",
                                benefit2: nil,
                                price: "10"
                            )
                            
                            shopItem(
                                imageName: "healthysnack",
                                title: "Healthy Snack",
                                benefit1: "+ Happiness",
                                benefit2: nil,
                                price: "15"
                            )
                            
                            shopItem(
                                imageName: "supermeal",
                                title: "Super Meal",
                                benefit1: "+ Happiness",
                                benefit2: "+ Energy",
                                price: "15"
                            )
                        }
                        .padding(.vertical, 28)
                        .padding(.horizontal, 22)
                        .background(Color.white.opacity(0.88))
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 6)
                        
                        Spacer(minLength: 20)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
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
                    
                    
                    NavigationLink(destination: Text("Profile Page")) {
                        navIcon(systemName: "person.crop.circle")
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 18)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func coinCard() -> some View {
        HStack(spacing: 14) {
            Text("")
                .font(.system(size: 28))
            
            Text("100")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.black)
        }
        .padding(.horizontal, 28)
        .padding(.vertical, 14)
        .background(Color(red: 0.75, green: 0.78, blue: 0.90))
        .cornerRadius(24)
    }
    
    func navIcon(systemName: String) -> some View {
        Image(systemName: systemName)
            .font(.system(size: 34))
            .foregroundColor(.black)
    }
    
    func priceTag(_ price: String) -> some View {
        HStack(spacing: 6) {
            Text("")
                .font(.system(size: 18))
            
            Text(price)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(Color(red: 0.75, green: 0.78, blue: 0.90))
        .cornerRadius(18)
    }
    
    func shopItem(
        imageName: String,
        title: String,
        benefit1: String,
        benefit2: String?,
        price: String
    ) -> some View {
        HStack(alignment: .center, spacing: 18) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.black)
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(benefit1)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.black)
                        
                        if let benefit2 = benefit2 {
                            Text(benefit2)
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    
                    priceTag(price)
                }
                
                Button(action: {
                    print("\(title) bought")
                }) {
                    Text("Buy")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(Color(red: 0.72, green: 0.86, blue: 0.81))
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.12), radius: 5, x: 0, y: 5)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FoodShop()
    }
}

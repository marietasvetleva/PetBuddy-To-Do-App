import SwiftUI

struct ContentView: View {
    
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
            
            
            VStack(spacing: 25) {
                
                Spacer()
                
                Text("Welcome to")
                    .font(.title2)
                
                Text("PetBuddy")
                    .font(.system(size: 50, weight: .bold))
                
                
                Text("Take care of your virtual pet by completing healthy tasks!")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                
                Image("pets")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 220)
                
                
                Spacer()
                
                
                Button(action: {
                    
                }) {
                    
                    Text("Get Started!")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: 260)
                        .background(Color(red: 0.63, green: 0.83, blue: 0.79))
                        .cornerRadius(20)
                        .shadow(radius: 6)
                    
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

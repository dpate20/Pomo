import SwiftUI

struct SettingsView: View {
    let backgroundColor = Color(red: 10/255, green: 10/255, blue: 30/255)
    let buttonColor = Color(red: 150/255, green: 0/255, blue: 0/255)
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("SETTINGS")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 30)
                
                SettingsButton(title: "HELP")
                SettingsButton(title: "SOUNDS")
                SettingsButton(title: "DATA & PRIVACY")
                SettingsButton(title: "ACCESSIBILITY")
                SettingsButton(title: "DISPLAY")
                SettingsButton(title: "WIDGETS")
                
                Spacer()
            }
            .padding(.top, 40)
        }
    }
}

struct SettingsButton: View {
    let title: String
    let buttonColor = Color(red: 150/255, green: 0/255, blue: 0/255)
    
    var body: some View {
        Button(action: {
            // TODO: Implement button actions
        }) {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
                .frame(width: 250, height: 50)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}

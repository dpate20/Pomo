import SwiftUI

struct ContentView: View {
    
    // Define a color scheme that approximates your wireframes
    let mainBackgroundColor = Color(red: 10/255, green: 10/255, blue: 30/255) // Dark navy
    let mainAccentColor = Color(red: 150/255, green: 0/255, blue: 0/255)      // Deep red
    
    var body: some View {
        TabView {
            TimerView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            StopwatchView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Stopwatch")
                }
            
            AlarmsView()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Alarms")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .accentColor(mainAccentColor) // Tab bar highlight color
    }
}

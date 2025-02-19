import SwiftUI

struct TimerView: View {
    // Timer logic
    @State private var totalSeconds: Int = 1200 // 20 minutes as default
    @State private var secondsRemaining: Int = 1200
    @State private var isRunning: Bool = false
    @State private var timer: Timer? = nil
    
    let backgroundColor = Color(red: 10/255, green: 10/255, blue: 30/255) // Dark navy
    let accentColor = Color(red: 150/255, green: 0/255, blue: 0/255)      // Deep red
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text(timeString(seconds: secondsRemaining))
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .bold))
                
                Button(action: {
                    if isRunning {
                        // Stop the timer
                        timer?.invalidate()
                        timer = nil
                        isRunning = false
                    } else {
                        // Start the timer
                        startTimer()
                    }
                }) {
                    Text(isRunning ? "STOP" : "START")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .background(accentColor)
                        .clipShape(Circle())
                }
            }
        }
    }
    
    // Convert seconds to MM:SS
    func timeString(seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d:00", minutes, secs)
    }
    
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                // Timer done
                timer?.invalidate()
                timer = nil
                isRunning = false
                // Optionally show alert or trigger sound
            }
        }
    }
}

import SwiftUI

struct StopwatchView: View {
    @State private var counter: Double = 0.0
    @State private var isRunning: Bool = false
    @State private var timer: Timer? = nil
    
    let backgroundColor = Color(red: 10/255, green: 10/255, blue: 30/255) // Dark navy
    let accentColor = Color(red: 150/255, green: 0/255, blue: 0/255)      // Deep red
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text(stopwatchString(time: counter))
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .bold))
                
                Button(action: {
                    if isRunning {
                        timer?.invalidate()
                        timer = nil
                        isRunning = false
                    } else {
                        startStopwatch()
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
    
    func stopwatchString(time: Double) -> String {
        let totalSeconds = Int(time)
        let minutes = totalSeconds / 60
        let secs = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
    
    func startStopwatch() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            counter += 1.0
        }
    }
}

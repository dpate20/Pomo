import SwiftUI

struct AlarmItem: Identifiable {
    var id = UUID()
    var time: String
    var label: String
    var isOn: Bool
}

struct AlarmsView: View {
    @State private var alarms = [
        AlarmItem(time: "7:00 AM", label: "ALARM", isOn: true),
        AlarmItem(time: "8:30 AM", label: "Class Starts", isOn: false),
        AlarmItem(time: "11:00 PM", label: "[Label]", isOn: true)
    ]
    
    let backgroundColor = Color(red: 10/255, green: 10/255, blue: 30/255)
    let accentColor = Color(red: 150/255, green: 0/255, blue: 0/255)
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("ALARMS")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                
                List {
                    ForEach($alarms) { $alarm in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(alarm.time)
                                    .font(.headline)
                                Text(alarm.label)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Toggle("", isOn: $alarm.isOn)
                                .labelsHidden()
                                .toggleStyle(SwitchToggleStyle(tint: accentColor))
                        }
                        .listRowBackground(Color.clear)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .padding()
        }
    }
}

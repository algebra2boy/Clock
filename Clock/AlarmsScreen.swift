//
//  AlarmsScreen.swift
//  Clock
//
//  Created by Yongye on 11/3/24.
//

import SwiftUI

struct AlarmsScreen: View {

    @State private var isAlarmOn: Bool = false

    @State private var presentAddAlarmScreen: Bool = false

    @State private var alarms: [Alarm] = []

    var body: some View {
        NavigationStack {
            List($alarms) { alarm in

                Section {

                    HStack {
                        VStack(alignment: .leading, spacing: -5) {
                            HStack(alignment: .lastTextBaseline, spacing: 2) {
                                Text("\(convertedToHourMinute(alarm.date))")
                                    .font(.system(size: 50, weight: .light))
                                Text("\(convertedToAMPM(alarm.date))")
                                    .font(.system(size: 30, weight: .light))
                            }

                            Text("Alarm, every day")
                                .font(.system(size: 18, weight: .light))
                        }
                        .foregroundStyle(isAlarmOn ? .black.opacity(0.5) : .black)

                        Spacer()

                        Toggle("", isOn: $isAlarmOn)
                    }

                } header: {
                    Text("my clocks")
                }

            }
            .listStyle(.inset)
            .navigationTitle("Alarms")
            .sheet(isPresented: $presentAddAlarmScreen) {
                AddAlarmScreen(alarms: $alarms)
            }
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        presentAddAlarmScreen.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    private func convertedToHourMinute(_ date: Binding<Date>) -> String {
        let hourMinuteFormatter = DateFormatter()
        hourMinuteFormatter.dateFormat = "h:mm"
        return hourMinuteFormatter.string(from: date.wrappedValue)
    }

    private func convertedToAMPM(_ date: Binding<Date>) -> String {
        let amPMFormatter = DateFormatter()
        amPMFormatter.dateFormat = "a"
        return amPMFormatter.string(from: date.wrappedValue)
    }
}

#Preview {
    AlarmsScreen()
}

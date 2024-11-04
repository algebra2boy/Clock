//
//  AddAlarmScreen.swift
//  Clock
//
//  Created by Yongye on 11/3/24.
//

import SwiftUI

struct AddAlarmScreen: View {

    @Environment(\.dismiss) private var dismiss

    @State private var date: Date = Date()

    @State private var label: String = ""

    @Binding var alarms: [Alarm]

    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("date picker", selection: $date, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()

                List {
                    HStack {
                        Text("Label")
                        TextField("Alarm", text: $label)
                            .multilineTextAlignment(.trailing)
                    }
                    .listRowBackground(Color(UIColor.systemGray6))
                }
                .scrollContentBackground(.hidden)

                Spacer()
            }
            .navigationTitle("Add Alarm")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(.all, edges: .bottom)
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addNewAlarm()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }

    func addNewAlarm() {
        let newAlarm = Alarm(date: date, label: label, isEnabled: false)
        alarms.append(newAlarm)
        alarms.sort(by: { $0.date < $1.date })
        print(alarms)
        dismiss()
    }
}

#Preview {
    AddAlarmScreen(alarms: .constant([]))
}

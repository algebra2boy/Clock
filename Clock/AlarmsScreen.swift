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

    var body: some View {
        NavigationStack {
            List {

                Section {

                    HStack {
                        VStack(alignment: .leading, spacing: -5) {
                            HStack(alignment: .lastTextBaseline, spacing: 2) {
                                Text("8:00")
                                    .font(.system(size: 55, weight: .light))
                                Text("AM")
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
                AddAlarmScreen()
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
}

#Preview {
    AlarmsScreen()
}

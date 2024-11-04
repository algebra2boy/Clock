//
//  AddAlarmScreen.swift
//  Clock
//
//  Created by Yongye on 11/3/24.
//

import SwiftUI

struct AddAlarmScreen: View {
    var body: some View {
        NavigationStack {
            VStack {

            }
            .navigationTitle("Add Alarm")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {
                    Button {

                    } label: {
                        Text("Cancel")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {

                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}

#Preview {
    AddAlarmScreen()
}

//
//  ContentView.swift
//  Clock
//
//  Created by Yongye on 11/3/24.
//

import SwiftUI


enum AppTab: String, Hashable {
    case worldClock
    case alarms
    case stopwatch
    case timers

    var title: String {
        switch self {
        case .worldClock: return "World Clock"
        case .alarms: return "Alarms"
        case .stopwatch: return "Stopwatch"
        case .timers: return "Timers"
        }
    }

    var systemImage: String {
        switch self {
        case .worldClock: return "globe"
        case .alarms: return "alarm"
        case .stopwatch: return "stopwatch"
        case .timers: return "timer"
        }
    }
}

struct ContentView: View {

    @State private var selectedTab: AppTab = .alarms

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(AppTab.worldClock.title, systemImage: AppTab.worldClock.systemImage, value: AppTab.worldClock) {
                Text("world clock")
            }

            Tab(AppTab.alarms.title, systemImage: AppTab.alarms.systemImage, value: AppTab.alarms) {
                AlarmsScreen()
            }

            Tab(AppTab.stopwatch.title, systemImage: AppTab.stopwatch.systemImage, value: AppTab.stopwatch) {
                Text("stop watch")
            }

            Tab(AppTab.timers.title, systemImage: AppTab.timers.systemImage, value: AppTab.timers) {
                Text("timer")
            }
        }
    }
}

#Preview {
    ContentView()
}

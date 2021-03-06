//
//  movement_recordApp.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/05.
//

import SwiftUI

@main
struct movement_recordApp: App {
    @StateObject private var workout = WorkoutModel()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(workout)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

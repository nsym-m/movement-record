//
//  WorkoutView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/05.
//

import SwiftUI
import WatchKit
import HealthKit

struct WorkoutView: View {
    @EnvironmentObject var workout: WorkoutModel
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selection: Tab = .metrics
    @State private var workoutActivityType: HKWorkoutActivityType
    
    init(workoutActivityType: HKWorkoutActivityType) {
        self.workoutActivityType = workoutActivityType
    }

    enum Tab {
        case controls, metrics, nowPlaying
    }

    var body: some View {
        TabView(selection: $selection) {
            ControlView().tag(Tab.controls)
            workoutActivityType.workView.tag(Tab.metrics)
            NowPlayingView().tag(Tab.nowPlaying)
        }
        .navigationTitle(workout.selectedWorkout?.name ?? "")
        .navigationBarHidden(selection == .nowPlaying)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        .onChange(of: isLuminanceReduced) { _ in
            displayMetricsView()
        }
    }

    private func displayMetricsView() {
        withAnimation {
            selection = .metrics
        }
    }
    
    
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workoutActivityType: .functionalStrengthTraining)
    }
}

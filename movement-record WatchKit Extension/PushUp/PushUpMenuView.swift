//
//  PushUpView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/05.
//

import SwiftUI
import HealthKit

struct PushUpMenuView: View {
    @EnvironmentObject var workout: WorkoutModel

    var body: some View {
        NavigationLink(
            destination: WorkoutView(workoutActivityType: .functionalStrengthTraining),
            tag: .functionalStrengthTraining,
            selection: $workout.selectedWorkout,
            label: {
                Text("Start PushUp!!")
            }
        )
    }
}

struct PushUpMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PushUpMenuView()
    }
}

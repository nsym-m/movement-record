//
//  WalkingView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/05.
//

import SwiftUI

struct WalkingMenuView: View {
    @EnvironmentObject var workout: WorkoutModel

    var body: some View {
        NavigationLink(
            destination: WorkoutView(workoutActivityType: .walking),
            tag: .walking,
            selection: $workout.selectedWorkout,
            label: {
                Text("Start Walking!!")
            }
        )
    }
}

struct WalkingMenuView_Previews: PreviewProvider {
    static var previews: some View {
        WalkingMenuView()
    }
}

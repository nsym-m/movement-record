//
//  ControlView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/11.
//

import SwiftUI
import HealthKit

struct ControlView: View {
    @EnvironmentObject var workout: WorkoutModel
    @State private var showAlert = false
    
    private var workoutActivityType: HKWorkoutActivityType
    
    init(workoutActivityType: HKWorkoutActivityType) {
        self.workoutActivityType = workoutActivityType
    }

    var body: some View {
        HStack {
            VStack {
                Button {
                    showAlert.toggle()
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(.red)
                .font(.title2)
                Text("End")
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("このワークアウトを終了します。よろしいですか？"),
                        primaryButton: .destructive(Text("終了"), action: {
                            workout.toggleToFirstView(workingType: workoutActivityType)
                            workout.endWorkout()
                        }),
                        secondaryButton: .default(Text("キャンセル"))
                    )
                }
            }
            VStack {
                Button {
                    workout.togglePause()
                } label: {
                    Image(systemName: workout.running ? "pause" : "play")
                }
                .tint(.yellow)
                .font(.title2)
                Text(workout.running ? "Pause" : "Resume")
            }
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(workoutActivityType: .walking)
    }
}

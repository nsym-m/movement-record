//
//  ControlView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/11.
//

import SwiftUI

struct ControlView: View {
    @EnvironmentObject var workout: WorkoutModel

    var body: some View {
        HStack {
            VStack {
                Button {
                    workout.endWorkout()
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(.red)
                .font(.title2)
                Text("End")
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
        ControlView()
    }
}

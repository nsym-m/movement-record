//
//  HomeView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/05.
//

import SwiftUI
import HealthKit

struct HomeView: View {
    @EnvironmentObject var workout: WorkoutModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(workout.workoutTypes) { workoutType in
                    NavigationLink(workoutType.name, destination: workoutType.menuView)
                        .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
                }
                .navigationBarTitle("Workouts")
                .onAppear {
                    workout.requestAuthorization()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

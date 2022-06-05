//
//  HomeView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/05.
//

import SwiftUI
import HealthKit

struct HomeView: View {
    @EnvironmentObject var workoutModel: WorkoutModel
    var workoutTypes: [HKWorkoutActivityType] = [.functionalStrengthTraining, .walking]
    
    var body: some View {
        NavigationView {
            VStack {
                List(workoutTypes) { workoutType in
                    NavigationLink(workoutType.name, destination: WorkoutView(),
                                   tag: workoutType, selection: $workoutModel.selectedWorkout)
                        .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
                }
                .navigationBarTitle("Workouts")
                .onAppear {
                    workoutModel.requestAuthorization()
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

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .functionalStrengthTraining:
            return "筋トレ"
        case .walking:
            return "散歩"
        default:
            return ""
        }
    }
}

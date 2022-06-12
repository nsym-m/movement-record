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
//                isActiveのところをListで回すことができないから一旦コメントアウト
//                List(workout.workoutTypes) { workoutType in
//                    NavigationLink(workoutType.name, destination: workoutType.menuView, isActive: $workout.toFirstViews[workoutType].showMenu)
//                        .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
//                }
                NavigationLink("筋トレ", destination: PushUpMenuView(), isActive: $workout.toFirstViewPushUp)
                    .onTapGesture {
                        workout.toFirstViewPushUp.toggle()
                    }
                NavigationLink("散歩", destination: WalkingMenuView(), isActive: $workout.toFirstViewWalking)
                    .onTapGesture {
                        workout.toFirstViewWalking.toggle()
                    }
                .navigationBarTitle("運動しよう！")
                .onAppear {
                    workout.requestAuthorization()
                }
            }
        }
        .sheet(isPresented: $workout.showingSummaryView) {
            SummaryView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  WorkoutView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/05.
//

import SwiftUI
import WatchKit

struct WorkoutView: View {
    @EnvironmentObject var workoutModel: WorkoutModel
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selection: Tab = .metrics

    enum Tab {
        case controls, metrics, nowPlaying
    }

    var body: some View {
        TabView(selection: $selection) {
            PushUpView().tag(Tab.controls)
            WalkingView().tag(Tab.metrics)
            NowPlayingView().tag(Tab.nowPlaying)
        }
        .navigationTitle(workoutModel.selectedWorkout?.name ?? "")
        .navigationBarHidden(selection == .nowPlaying)
        .onChange(of: workoutModel.running) { _ in
            displayMetricsView()
        }
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
        WorkoutView()
    }
}

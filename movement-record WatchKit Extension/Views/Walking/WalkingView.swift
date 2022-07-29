//
//  WalkingView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/11.
//

import SwiftUI
import HealthKit
import Foundation

struct WalkingView: View {
    @EnvironmentObject var workout: WorkoutModel

    var body: some View {
        TimelineView(MetricsTimelineSchedule(from: workout.builder?.startDate ?? Date())) { context in
            VStack(alignment: .leading) {
                // 時間経過表示
                ElapsedTimeView(elapsedTime: workout.builder?.elapsedTime ?? 0)
                    .foregroundStyle(.yellow)
                // 移動距離
                Text(Measurement(value: workout.distance, unit: UnitLength.meters).formatted(.measurement(width: .abbreviated, usage: .road)))
                // 歩数
                Text(
                    String.localizedStringWithFormat("%d 歩", workout.stepCount)
                )
            }
            .font(.system(.title, design: .rounded).monospacedDigit().lowercaseSmallCaps())
            .frame(maxWidth: .infinity, alignment: .leading)
            .ignoresSafeArea(edges: .bottom)
            .scenePadding()
        }
    }
}

struct WalkingView_Previews: PreviewProvider {
    static var previews: some View {
        WalkingView()
    }
}

private struct MetricsTimelineSchedule: TimelineSchedule {
    var startDate: Date

    init(from startDate: Date) {
        self.startDate = startDate
    }

    func entries(from startDate: Date, mode: TimelineScheduleMode) -> PeriodicTimelineSchedule.Entries {
        PeriodicTimelineSchedule(from: self.startDate, by: (mode == .lowFrequency ? 1.0 : 1.0 / 30.0))
            .entries(from: startDate, mode: mode)
    }
}

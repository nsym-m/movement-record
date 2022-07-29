//
//  SummaryView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/13.
//

import SwiftUI

struct SummaryView: View {
    @EnvironmentObject var workout: WorkoutModel
    @Environment(\.dismiss) var dismiss
    @State private var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var body: some View {
        if workout.workout == nil {
            ProgressView("Saving Workout")
                .navigationBarHidden(true)
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    // TODO: 腕立て伏せ版Summary作成
                    SummaryMetricView(title: "歩いた時間",
                                      value: durationFormatter.string(from: workout.workout?.duration ?? 0.0) ?? "")
                        .foregroundStyle(.yellow)
                    SummaryMetricView(title: "歩いた距離",
                                      value: Measurement(value: workout.workout?.totalDistance?.doubleValue(for: .meter()) ?? 0,
                                                         unit: UnitLength.meters)
                                        .formatted(.measurement(width: .abbreviated,
                                                                usage: .road,
                                                                numberFormatStyle: .number.precision(.fractionLength(2)))))
                        .foregroundStyle(.green)
                    SummaryMetricView(title: "合計歩数",
                                      value: String.localizedStringWithFormat("%d 歩", workout.stepCount))
                        .foregroundStyle(.yellow)
                        
                    Button("Twitterに投稿") {
                        // TODO: Twitter投稿
                    }
                    
                    Button("閉じる") {
                        dismiss()
                    }
                }
                .scenePadding()
            }
            .navigationTitle("結果")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}

struct SummaryMetricView: View {
    var title: String
    var value: String

    var body: some View {
        Text(title)
            .foregroundStyle(.foreground)
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
        Divider()
    }
}

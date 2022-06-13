//
//  HKWorkoutActivityType+.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/14.
//

import Foundation
import HealthKit
import SwiftUI

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
    
    @ViewBuilder
    var menuView: some View {
        switch self {
        case .functionalStrengthTraining:
            PushUpMenuView()
        case .walking:
            WalkingMenuView()
        default:
            HomeView()
        }
    }
    
    @ViewBuilder
    var workView: some View {
        switch self {
        case .functionalStrengthTraining:
            PushUpView()
        case .walking:
            WalkingView()
        default:
            HomeView()
        }
    }
}

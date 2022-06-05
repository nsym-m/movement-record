//
//  HomeView.swift
//  movement-record WatchKit Extension
//
//  Created by 西山幹也 on 2022/06/05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: WalkingView(), label: {
                        Text("散歩計測")
                    })
                    
                    NavigationLink(destination: PushUpView(), label: {
                        Text("腕立て伏せ計測")
                    })
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

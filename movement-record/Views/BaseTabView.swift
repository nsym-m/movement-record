//
//  BaseTabView.swift
//  movement-record
//
//  Created by 西山幹也 on 2022/07/31.
//

import SwiftUI

struct BaseTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("ホーム")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("設定")
                }
        }
    }
}

struct BaseTabView_Previews: PreviewProvider {
    static var previews: some View {
        BaseTabView()
    }
}

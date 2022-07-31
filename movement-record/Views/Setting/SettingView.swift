//
//  SettingView.swift
//  movement-record
//
//  Created by 西山幹也 on 2022/07/31.
//

import SwiftUI

struct SettingView: View {
    @State var twitter = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        Text("Twitter連携")
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        twitter = true
                    }
                    .alert(isPresented: $twitter, content: {
                        Alert(
                            title: Text("Twitter連携しますか？"),
                            primaryButton: .default(Text("はい"),
                                                    action: {}),
                            secondaryButton: .destructive(Text("いいえ")))
                    })
                }
            }
            .navigationTitle(Text("設定"))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

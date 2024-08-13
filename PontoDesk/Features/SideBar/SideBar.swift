//
//  SideBar.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct SideBar: View {
    @State private var currentTab: TabOptions = .point
    @State var showTabBar: Bool = true
    @State var showLegend: Bool = false
    @AppStorage("userToken") var userToken = ""

    var body: some View {
        GeometryReader{reader in
            let size = reader.size
            
            HStack(spacing: 0){
                SideBarLayout(currentTab: $currentTab, size: size)
                
                SideBarManager(hideTabBar: showTabBar, selection: $currentTab){
                    ForEach(TabOptions.allCases, id: \.rawValue){ tab in
                        tab.correspondingView
                            .tag(tab)
                    }
                }
            }.frame(width: size.width, height: size.height, alignment: .leading)
            
        }.background()
            .animation(.snappy(duration: 0.28), value: currentTab)
    }
}

#Preview {
    SideBar()
}

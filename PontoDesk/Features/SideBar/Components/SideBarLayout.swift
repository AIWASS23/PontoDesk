//
//  SideBarLayout.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct SideBarLayout: View {
    @Binding var currentTab: TabOptions
    var size: CGSize
    @State private var showLegend = false
    @AppStorage("userToken") var userToken = ""
    var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            
            SideBarButton(buttonAction: {
                print("Eu funciono")
            }, showLegend: $showLegend, tabName: "PontoDesk", tabIcon: "clock-icon", currentTab: $currentTab)
            
            Spacer()
            
            ForEach(TabOptions.allCases, id: \.rawValue) { tab in
                SideBarButton(buttonAction: {
                    currentTab = tab
                }, showLegend: $showLegend, tabName: tab.rawValue, tabIcon: tab.symbol, currentTab: $currentTab)
            }
            
            Spacer()
            
            SideBarButton(buttonAction: {
                loginViewModel.emptyToken()
            }, showLegend: $showLegend, tabName: "Logout", tabIcon: "logout-icon", currentTab: $currentTab)
            
            Spacer()
        }
        .frame(height: size.height)
        .animation(.snappy(duration: 0.28), value: currentTab)
        .buttonStyle(.plain)
        .padding(10)
        .background(Color.bgDarkBlue)
        .onHover { hovering in
            showLegend.toggle()
        }
    }
}

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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            
            SidebarUniqueItem(showLegend: $showLegend, itemIcon: "clock-icon", itemName: "PontoDesk")
            
            Spacer()
            
            SideBarButton(currentTab: $currentTab, showLegend: $showLegend)
            
            Spacer()
            
            SidebarUniqueItem(showLegend: $showLegend, itemIcon: "logout-icon", itemName: "Logout")
            
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

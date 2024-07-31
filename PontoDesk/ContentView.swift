//
//  ContentView.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Sidebar(backgroundColor: Color("primaryBackground"),
                foregroundColor: .blue,
                header: "IONavigation",
                itemGroups: sidebarItemGroups,
                actionIcon: Image(systemName: "plus.circle.fill"),
                action: add)
    }
//    private func add() {
//        return
//    }
//    
//    private var tabbarItems: [Item] {
//        HomeTab.items
//    }
//
//    private var sidebarItemGroups: [ItemGroup] {
//        [homeGroup, appGroup, settingsGroup]
//    }
//    
//    private var homeGroup: ItemGroup {
//        ItemGroup(id: "home", items: HomeTab.items)
//    }
//    
//    private var appGroup: ItemGroup {
//        ItemGroup(id: "library", header: "Library", items: LibraryTab.items)
//    }
//    
//    private var settingsGroup: ItemGroup {
//        ItemGroup(id: "settings", header: "Settings", items: SettingsTab.items, isCollapsable: false)
//    }
    
}


#Preview {
    ContentView()
}

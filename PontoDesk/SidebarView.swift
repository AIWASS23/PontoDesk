//
//  SidebarView.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selectedId: String
    
    let backgroundTranslucency: Bool
    let backgroundColor: Color
    let foregroundColor: Color
    let header: String?
    let headerFont: Font?
    let itemGroups: [ItemGroup]
    let itemFont: Font?
    let actionIcon: Image?
    let actionTooltip: String?
    let actionShortcut: KeyboardShortcut?
    let action: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let header {
                SidebarHeader(header: header,
                              font: headerFont ?? .system(size: 18, weight: .semibold),
                              color: foregroundColor,
                              actionIcon: actionIcon,
                              actionTooltip: actionTooltip,
                              actionShortcut: actionShortcut,
                              action: action)
            }
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    ForEach(itemGroups) { group in
                        ItemGroupView(selectedId: $selectedId,
                                      header: group.header,
                                      font: itemFont ?? .system(size: 15),
                                      items: group.items,
                                      isCollapsable: group.isCollapsable)
                    }
                }
                .padding(.bottom, 12)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        #if os(macOS)
        .if(backgroundTranslucency) { sidebar in
            sidebar.translucentBackground()
        }
        .if(!backgroundTranslucency) { sidebar in
            sidebar.background(backgroundColor)
        }
        #else
        .background(backgroundColor)
        #endif
    }
    
}


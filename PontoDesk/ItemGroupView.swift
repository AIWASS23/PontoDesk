//
//  ItemGroupView.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct ItemGroupView: View {
    
    @Binding var selectedId: String
    @State var isCollapsed = false
    let header: String?
    let font: Font
    let items: [Item]
    let isCollapsable: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let header = header {
                ItemGroupHeader(isCollapsed: $isCollapsed,
                                header: header,
                                font: font,
                                isCollapsable: isCollapsable)
            }
            
            if !isCollapsed {
                VStack(spacing: 5) {
                    ForEach(items) { item in
                        Button {
                            self.selectedId = item.id
                        } label: {
                            SidebarItem(item: item,
                                        font: font,
                                        isSelected: selectedId == item.id)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

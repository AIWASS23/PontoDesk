//
//  SidebarItem.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct SidebarItem: View {
    
    @State var isHovering = false
    let item: Item
    let font: Font
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            SidebarIcon(image: item.image, color: isSelected ? item.selectionTextColor : item.defaultTitleColor)
            
            Text(item.title)
                .font(font)
                .foregroundColor(isSelected ? item.selectionTextColor : item.defaultTitleColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let detailView = item.detailView {
                detailView
            }
        }
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 30, alignment: .leading)
        .background(.white.opacity(0.00001))
        .background(isHovering ? AnyView(item.selectionBackground.opacity(0.4)) : AnyView(Color.clear))
        .background(isSelected ? item.selectionBackground : AnyView(Color.clear))
        .cornerRadius(8)
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
}

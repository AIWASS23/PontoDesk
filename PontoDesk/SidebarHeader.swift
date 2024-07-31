//
//  SidebarHeader.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//


import SwiftUI

struct SidebarHeader: View {
    let header: String?
    let font: Font
    let color: Color
    
    let actionIcon: Image?
    let actionTooltip: String?
    let actionShortcut: KeyboardShortcut?
    let action: (() -> Void)?
    
    var body: some View {
        if let header {
            HStack(spacing: 0) {
                Text(header)
                    .font(font)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 44)
                
                
                if let actionIcon, let action {
                    if #available(iOS 15.4, macOS 12.3, *) {
                        SidebarButton(image: actionIcon, color: color, tooltip: actionTooltip, action: action)
                            .keyboardShortcut(actionShortcut)
                    } else {
                        SidebarButton(image: actionIcon, color: color, tooltip: actionTooltip, action: action)
                    }
                }
            }
            .padding(.leading, 6)
            .padding(.top, 16)
        }
    }
}

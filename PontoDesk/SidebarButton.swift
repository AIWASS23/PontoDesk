//
//  SidebarButton.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct SidebarButton: View {
    
    @State private var isHovering = false
    
    let image: Image
    let color: Color
    let tooltip: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            image
                .resizable()
                .scaledToFit()
                .foregroundColor(.primary)
                .frame(width: 16, height: 16)
                .padding(8)
                .background(isHovering ? color.opacity(0.1) : .clear)
                .cornerRadius(8)
        }
        .buttonStyle(.plain)
        .background(.white.opacity(0.00001))
        .cornerRadius(8)
        .onHover { hovering in
            self.isHovering = hovering
        }
        .help(tooltip ?? "")
    }
}

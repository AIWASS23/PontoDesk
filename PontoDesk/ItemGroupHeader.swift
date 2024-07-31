//
//  ItemGroupHeader.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct ItemGroupHeader: View {
    @Binding var isCollapsed: Bool
    
    let header: String
    let font: Font
    let isCollapsable: Bool
    
    var body: some View {
        Button(action: collapseGroup) {
            HStack(spacing: 0) {
                Text(header)
                    .font(font)
                    .padding(.leading,8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if isCollapsable {
                    Image(systemName: "chevron.right")
                        .frame(width: 16, height: 16)
                        .rotationEffect(Angle.degrees(isCollapsed ? 0 : 90))
                }
            }
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.gray)
            .background(.white.opacity(0.00001))
        }
        .buttonStyle(.plain)
    }
        
    private func collapseGroup() {
        if !isCollapsable { return }
        withAnimation {
            isCollapsed.toggle()
        }
    }
}

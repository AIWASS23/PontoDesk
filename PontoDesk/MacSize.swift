//
//  MacSize.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct MacSize: ViewModifier {
    let minWidth: CGFloat
    let maxWidth: CGFloat
    let minHeight: CGFloat
    let maxHeight: CGFloat
    
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: minHeight, maxHeight: maxHeight)
    }
}

extension View {
    func macSize(
        minWidth: CGFloat = 400,
        maxWidth: CGFloat = .infinity,
        minHeight: CGFloat = 400,
        maxHeight: CGFloat = .infinity
    ) -> some View {
        modifier(MacSize(
            minWidth: minWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            maxHeight: maxHeight
        ))
    }
}

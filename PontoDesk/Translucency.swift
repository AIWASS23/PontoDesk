//
//  Translucency.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct Translucency: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(TranslucentView(material: .sidebar))
            .ignoresSafeArea(.all)
            
    }
}

extension View {
    func translucentBackground() -> some View {
        modifier(Translucency())
    }
}


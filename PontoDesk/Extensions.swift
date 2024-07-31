//
//  Extensions.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func setupTabItem(_ item: Item) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(item)
    }
}

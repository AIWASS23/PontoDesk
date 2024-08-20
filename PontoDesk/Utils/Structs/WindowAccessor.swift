//
//  WindowAccessor.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 19/08/24.
//

import SwiftUI

struct WindowAccessor: View {
    var configure: (NSWindow?) -> Void
    
    var body: some View {
        EmptyView()
            .background(AccessorView(configure: configure))
    }
}

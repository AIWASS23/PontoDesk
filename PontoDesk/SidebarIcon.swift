//
//  SidebarIcon.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct SidebarIcon: View {
    let image: Image
    let color: Color
    
    var body: some View {
        image
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .frame(width: 16, height: 16)
            .foregroundColor(color)
    }
}


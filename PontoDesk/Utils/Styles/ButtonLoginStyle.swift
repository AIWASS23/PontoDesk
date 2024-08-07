//
//  ButtonLoginPattern.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 07/08/24.
//

import SwiftUI

struct ButtonLoginStyle: ButtonStyle {
    var parentContainerSize: GeometryProxy
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: parentContainerSize.size.width/3, height: parentContainerSize.size.height/24)
            .padding(6)
            .background(.bgDarkBlue)
            .cornerRadius(10)
            .padding(parentContainerSize.size.width/80)
            .foregroundColor(.white)
    }
}

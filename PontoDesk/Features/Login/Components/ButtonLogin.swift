//
//  ButtonLogin.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct ButtonLogin: View {
    var buttonImage: String
    var buttonText: String
    var parentContainerSize: GeometryProxy
    
    var body: some View {
        Button(action: {}, label: {
            HStack(alignment: .center){
                Image(buttonImage)
                
                Text(buttonText)
                    .font(.title2.weight(.regular))
            }
            .frame(width: parentContainerSize.size.width/3, height: parentContainerSize.size.height/24)
            .padding(6)
            .background(.bgDarkBlue)
            .cornerRadius(10)
            .padding(parentContainerSize.size.width/80)
        })
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.white)
    }
}

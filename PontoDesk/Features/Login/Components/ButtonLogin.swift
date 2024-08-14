//
//  ButtonLogin.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct ButtonLogin: View {
    var buttonAction: () -> ()
    var buttonImage: String
    var buttonText: String
    var parentContainerSize: GeometryProxy
    @State var buttonClicked: Bool =  false
    
    init(buttonImage: String, buttonText: String, parentContainerSize: GeometryProxy, buttonAction: @escaping () -> Void) {
        self.buttonImage = buttonImage
        self.buttonText = buttonText
        self.parentContainerSize = parentContainerSize
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        Button(action: {
            buttonAction()
            buttonClicked.toggle()
        }, label: {
            HStack(alignment: .center){
                Image(buttonImage)
                
                Text(buttonText)
                    .font(.title2.weight(.regular))
            }
        })
        .buttonStyle(ButtonLoginStyle(parentContainerSize: parentContainerSize))
    }
}

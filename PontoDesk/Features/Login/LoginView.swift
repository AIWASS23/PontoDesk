//
//  LoginView.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct LoginView: View {
    var screenSize: GeometryProxy
    
    var body: some View {
        HStack(alignment: .center){
           Image("login-image")
                .resizable()
                .scaledToFit()
                        
            VStack(alignment: .center){
                VStack(alignment: .center){
                    Image("logo-pontodesk")
                    Text("PontoDesk")
                        .font(.title.weight(.semibold))
                }.padding()
                
                VStack(alignment: .center){
                    Text("Faça login no PontoDesk!")
                        .font(.title.weight(.regular))
                    
                    VStack(alignment: .center){
                        ButtonLogin(buttonImage: "apple-logo", buttonText: "Login com Apple", parentContainerSize: screenSize)
                        ButtonLogin(buttonImage: "google-logo", buttonText: "Login com Google", parentContainerSize: screenSize)
                        ButtonLogin(buttonImage: "github-logo", buttonText: "Login com Github", parentContainerSize: screenSize)
                    }
                }
            }.padding()
        }.padding(screenSize.size.width/30)
            .frame(width: screenSize.size.width, height: screenSize.size.height)
            .foregroundColor(.black)
    }
}

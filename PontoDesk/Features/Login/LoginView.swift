//
//  LoginView.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct LoginView: View {
    var screenSize: GeometryProxy
    @Environment (\.openWindow) var openWindow
    @Binding var currentUrl: String
    
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
                        ButtonLogin(buttonImage: "google-logo", buttonText: "Login com Google", parentContainerSize: screenSize){
                            currentUrl = "https://www.youtube.com/watch?v=FhPLQVlUiNQ&list=RDZHDnDv6qjs8&index=7"
                            openWindow(id: "auth1")
                            print("Eu funciono como botão de login do Google")
                        }
                        ButtonLogin(buttonImage: "github-logo", buttonText: "Login com Github", parentContainerSize: screenSize){
                            currentUrl = "https://github.com/AIWASS23/PontoDesk"
                            openWindow(id: "auth")
                            print("Eu funciono como botão de login do Github")
                        }
                    }
                }
            }.padding()
        }.padding(screenSize.size.width/30)
            .frame(width: screenSize.size.width, height: screenSize.size.height)
            .foregroundColor(.black)
    }
}

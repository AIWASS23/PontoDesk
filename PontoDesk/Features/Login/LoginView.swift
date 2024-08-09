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
    @Binding var currentUrl: URL
    
    private let urlGoogle = GoogleURL(client_id: "xxxx", redirect_uri: "xxxx")
    private let urlGitHub = GitHubURL(client_id: "Ov23liGARcYKfhDcZ4yo", redirect_uri: "https://ncvvjec7c7.execute-api.us-east-2.amazonaws.com/auth/auth/github")
        
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
                            if let url = urlGoogle.url {
                                currentUrl = url
                                openWindow(id: "auth")
                                print("Eu funciono como botão de login do Google")
                            }else{
                                print("Can not open passed URL")
                            }
                        }
                        
                        ButtonLogin(buttonImage: "github-logo", buttonText: "Login com Github", parentContainerSize: screenSize){
                            if let url = urlGitHub.url {
                                currentUrl = url
                                openWindow(id: "auth")
                                print("Eu funciono como botão de login do GitHub")
                            }else{
                                print("Can not open passed URL")
                            }
                        }
                    }
                }
            }.padding()
        }.padding(screenSize.size.width/30)
            .frame(width: screenSize.size.width, height: screenSize.size.height)
            .foregroundColor(.black)
    }
}

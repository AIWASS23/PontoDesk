//
//  PontoDeskApp.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 29/07/24.
//

import SwiftUI
import FirebaseCore

@main
struct PontoDeskApp: App {
    @State var currentUrl: URL = URL(fileURLWithPath: "")
    var loginViewModel = LoginViewModel()
    @AppStorage("userToken") var userToken = ""

    init() {
        UserDefaults.standard.register(
            defaults: ["NSApplicationCrashOnExceptions": true]
        )
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        Window("PontoDesk", id: "mainWindow"){
            GeometryReader{reader in

                if userToken.isEmpty{
                    LoginView(screenSize: reader, currentUrl: $currentUrl)
                        .background(.bgScreen)
                }else{
                    SideBar()
                }
            }
            .onOpenURL(perform: { url in
                if let component =  URLComponents(url: url, resolvingAgainstBaseURL: true){
                    guard let token = component.queryItems?[0].value else { return }
                    loginViewModel.setToken(token: token)
                }
            })
            .handlesExternalEvents(preferring: ["pontodesk"], allowing: ["pontodesk"])
        }
        
        Window("Entrar no PontoDesk", id: "auth"){
            LoginWebView(url: self.currentUrl)
                    .frame(minWidth: 900, maxWidth: 900, minHeight: 450, maxHeight: 450)
        }
        .windowResizability(.contentSize)
    }
}

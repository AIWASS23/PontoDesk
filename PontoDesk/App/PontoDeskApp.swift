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
    
    init() {
        UserDefaults.standard.register(
            defaults: ["NSApplicationCrashOnExceptions": true]
        )
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            GeometryReader{reader in
                LoginView(screenSize: reader, currentUrl: $currentUrl)
                    .background(.bgScreen)
            }
        
        }
        Window("Entrar no PontoDesk", id: "auth"){
            LoginWebView(url: self.currentUrl)
                    .frame(minWidth: 900, maxWidth: 900, minHeight: 450, maxHeight: 450)
        }.windowResizability(.contentSize)
    }
}

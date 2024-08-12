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
            .onOpenURL(perform: { url in
                if let component =  URLComponents(url: url, resolvingAgainstBaseURL: true){
                    print(component.queryItems?[0])
                }
            })
            .handlesExternalEvents(preferring: ["pontodesk"], allowing: ["pontodesk"])
        
        }
        
        Window("Entrar no PontoDesk", id: "auth"){
            LoginWebView(url: self.currentUrl)
                    .frame(minWidth: 900, maxWidth: 900, minHeight: 450, maxHeight: 450)
        }.windowResizability(.contentSize)
    }
}

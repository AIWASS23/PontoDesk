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
            .frame(minWidth: 900, maxWidth: .infinity, minHeight: 450, maxHeight: .infinity)
            .handlesExternalEvents(preferring: ["pontodesk"], allowing: ["pontodesk"])
        }
        .windowResizability(.contentSize)

        Window("Entrar no PontoDesk", id: "auth"){
            if userToken.isEmpty {
                LoginWebView(url: self.currentUrl)

                    .frame(minWidth: 900, maxWidth: 900, minHeight: 450, maxHeight: 450)

            } else {
                PointView()
                    .background(.bgScreen)
                    .frame(minWidth: 900, maxWidth: .infinity, minHeight: 450, maxHeight: .infinity)
            }
        }
        .windowResizability(.contentSize)

        Window("Reserve Room", id: "reserveRoomWindow") {
            ReserveRoomView()
                .frame(minWidth: 900, maxWidth: .infinity, minHeight: 450, maxHeight: .infinity)
        }
        .windowResizability(.contentSize)
    }
}

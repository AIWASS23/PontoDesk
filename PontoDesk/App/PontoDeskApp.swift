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
    
    init() {
        UserDefaults.standard.register(
            defaults: ["NSApplicationCrashOnExceptions": true]
        )
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //            GeometryReader{reader in
            //                LoginView(screenSize: reader)
            //                    .background(.bgScreen)
            //            }
            RoomReservationView()
                .frame(minWidth: 1000, minHeight: 800)
        }
        .windowResizability(.contentMinSize)
    }
}

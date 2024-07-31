//
//  SidebarSelection.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import Foundation

class SidebarSelection: ObservableObject {
    static let shared = SidebarSelection()
    @Published var selectedViewID = ""
    
}


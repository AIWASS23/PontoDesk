//
//  Reservation.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 13/08/24.
//

import SwiftUI

struct Reservation: Identifiable {
    
    let id = UUID()
    let name: String
    let entryTime: Date
    let exitTime: Date
}

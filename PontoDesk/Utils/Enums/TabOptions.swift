//
//  TabOptions.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import Foundation
import SwiftUI

enum TabOptions: String, CaseIterable{
    case point = "Ponto"
    case bookTable = "Reserva Mesa"
    case bookRoom = "Reservar Sala"
    
    var symbol: String{
        switch self {
        case .point:
            return "point-icon"
        case .bookTable:
            return "table-icon"
        case .bookRoom:
            return "room-icon"
        }
    }
    
    @ViewBuilder
    var correspondingView: some View{
        switch self{
        case .point:
            PointView()
        case .bookTable:
            BookTableView()
        case .bookRoom:
            ReserveRoomView()
        }
    }
}

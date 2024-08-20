//
//  doClockResult.swift
//  PontoDesk
//
//  Created by Marcos Bezerra on 18/08/24.
//

import Foundation

struct ClockResult{
    let entry: String?
    let exit: String?
    let total: String?
}


extension ClockResult: Codable{
}

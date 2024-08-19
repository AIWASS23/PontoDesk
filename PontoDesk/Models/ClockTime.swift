//
//  ClockTime.swift
//  PontoDesk
//
//  Created by Marcos Bezerra on 16/08/24.
//

import Foundation

struct ClockTime{
    let result: Result
    struct Result: Codable{
        let entry: String?
        let exit: String?
        let total: String?
    }
}

extension ClockTime: Codable{}


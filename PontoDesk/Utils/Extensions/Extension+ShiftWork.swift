//
//  Extension+ShiftWork.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 12/08/24.
//

import Foundation

extension ShiftWork {
    var timeRangeDescription: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return "\(formatter.string(from: timeRange.lowerBound)) - \(formatter.string(from: timeRange.upperBound))"
    }
}

//
//  ReserveRoomTimeViewModel.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 14/08/24.
//

import SwiftUI

class ReserveRoomTimeViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var selectedShift: ShiftWork = .morning
    @Published var entryTimeIndex: Date = Date()
    @Published var exitTimeIndex: Date = Calendar.current.date(
        bySettingHour: 9,
        minute: 0,
        second: 0, of: Date())!
    @Published var reservationDate: Date = Date()

    var onReserve: ((Reservation) -> Void)?
    
    init(onReserve: ((Reservation) -> Void)? = nil) {
        self.onReserve = onReserve
        adjustTimesForShift()
    }
    
    var isReserveButtonDisabled: Bool {
        if name.isEmpty {
            return true
        }
        
        let minimumTimeInterval: TimeInterval = 15 * 60
        let timeDifference = exitTimeIndex.timeIntervalSince(entryTimeIndex)
        
        return timeDifference < minimumTimeInterval
    }
    
    func adjustTimesForShift() {
        let calendar = Calendar.current
        let currentTime = Date()
        
        // Adjust entryTimeIndex if out of shift bounds
        if !selectedShift.timeRange.contains(entryTimeIndex) {
            entryTimeIndex = selectedShift.timeRange.lowerBound
        }
        
        // Adjust exitTimeIndex based on entryTimeIndex and shift bounds
        if exitTimeIndex < entryTimeIndex || !selectedShift.timeRange.contains(exitTimeIndex) {
            exitTimeIndex = calendar.date(byAdding: .hour, value: 1, to: entryTimeIndex) ?? selectedShift.timeRange.upperBound
        }
        
        // If current time is later than shift bounds, adjust accordingly
        if currentTime > selectedShift.timeRange.upperBound {
            entryTimeIndex = selectedShift.timeRange.lowerBound
            exitTimeIndex = selectedShift.timeRange.upperBound
        }
    }
    
    func adjustEntryTime(_ newValue: Date) {
        entryTimeIndex = newValue
        
        // Ensure the exit time stays valid
        if exitTimeIndex <= entryTimeIndex {
            exitTimeIndex = Calendar.current.date(
                byAdding: .minute,
                value: 15,
                to: entryTimeIndex
            ) ?? selectedShift.timeRange.upperBound
        }
    }
    
    func adjustExitTime(_ newValue: Date) {
        exitTimeIndex = newValue
        
        // Ensure the exit time is within bounds and after the entry time
        if exitTimeIndex <= entryTimeIndex {
            exitTimeIndex = Calendar.current.date(
                byAdding: .minute,
                value: 15,
                to: entryTimeIndex
            ) ?? selectedShift.timeRange.upperBound
        }
        
        if exitTimeIndex > selectedShift.timeRange.upperBound {
            exitTimeIndex = selectedShift.timeRange.upperBound
        }
    }
    
    func reserveRoom() {
        if entryTimeIndex >= exitTimeIndex {
            print("Horário inválido: O horário de entrada deve ser antes do horário de saída.")
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let entryTimeString = formatter.string(from: entryTimeIndex)
        let exitTimeString = formatter.string(from: exitTimeIndex)
        print("Sala reservada por \(name) das \(entryTimeString) às \(exitTimeString)")
        
        if let onReserve = onReserve {
            let reservation = Reservation(name: name, entryTime: entryTimeIndex, exitTime: exitTimeIndex)
            onReserve(reservation)
        }
    }
}

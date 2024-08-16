//
//  ReserveRoomDayViewModel.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 14/08/24.
//

import SwiftUI

class ReserveRoomDayViewModel: ObservableObject {
    @Published var date = Date() {
        didSet {
            updateDateInfo()
            checkPreviousButtonState()
        }
    }
    
    @Published var dayOfWeek = ""
    @Published var formattedDate = ""
    @Published var isPreviousButtonEnabled = true
    
    init() {
        updateDateInfo()
        checkPreviousButtonState()
    }
    
    func updateTimeOnly() {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let currentTime = Date()
        components.hour = calendar.component(.hour, from: currentTime)
        components.minute = calendar.component(.minute, from: currentTime)
        components.second = calendar.component(.second, from: currentTime)
        date = calendar.date(from: components) ?? date
    }
    
    func updateDateInfo() {
        dayOfWeek = getDayOfWeek(date: date)
        formattedDate = formatDate(date: date)
    }
    
    // Verifica se o botão de "voltar" deve ser habilitado ou desabilitado
    func checkPreviousButtonState() {
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: Date())
        let displayedDate = calendar.startOfDay(for: date)
        
        // Desabilita o botão se a data exibida for menor ou igual à data atual
        isPreviousButtonEnabled = displayedDate > currentDate
    }
    
    func getDayOfWeek(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-BR")
        dateFormatter.dateFormat = "d 'de' MMMM" // Format: 29 de Julho
        let formattedDayOfWeek = getDayOfWeek(date: date)
        return "\(formattedDayOfWeek). \(dateFormatter.string(from: date))"
    }
}

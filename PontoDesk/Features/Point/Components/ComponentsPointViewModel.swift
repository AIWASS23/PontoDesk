//
//  ComponentsPointViewModel.swift
//  PontoDesk
//
//  Created by Ricardo Silva Vale on 09/08/24.
//

import SwiftUI
import Combine

class ComponentsPointViewModel: ObservableObject {
    @Published var date = Date(){
        didSet{
            updateDateInfo()
            checkAdvanceButtonState()
        }
    }
    @Published  var dayOfWeek = ""
    @Published  var formattedDate = ""
    @Published  var dataInicial: Date?
    @Published  var dataFinal: Date?
    @Published  var totalHorasEMinutos = ""
    @Published  var dataEntrada = ""
    @Published  var horaEntrada = ""
    @Published  var dataSaida = ""
    @Published  var horaSaida = ""
    @Published  var stateButton: (btentrada: Bool, btsaída: Bool, bool3: Bool, stsaida:Bool) = (false, true, true, false)
    
    @AppStorage("userToken") var token = ""
    @AppStorage("userId") var userId = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        updateDateInfo()
        checkAdvanceButtonState()
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
    
    func checkAdvanceButtonState() {
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: Date())
        let displayedDate = calendar.startOfDay(for: date)
        
        // Atualiza o estado do botão com base na comparação das datas
        stateButton.bool3 = displayedDate == currentDate
        
        if displayedDate != currentDate{
            stateButton.btentrada = true
        }
    }
    
    func getDayOfWeek(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-BR")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    func formatDatePonto(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-BR")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    func formatHourPonto(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt-BR")
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    func calculateTimeDifference(start: Date, end: Date) -> String {
        let difference = Calendar.current.dateComponents([.hour, .minute], from: start, to: end)
        let hours = difference.hour ?? 0
        let minutes = difference.minute ?? 0
        return "\(hours) horas e \(minutes) minutos."
    }
    
    func clockIn() async -> Bool{
        let api = pdAPI(token: token)
        return await api.doClockIn(userID: userId)
    }
    
    func clockOut() async -> Bool{
        let api = pdAPI(token: token)
        return await api.doClockOut(userID: userId)
    }
    
    func getCurrentClock() async -> ClockTime?{
        let api = pdAPI(token: token)
        return await api.getCurrentClock()
    }
}


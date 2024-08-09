//
//  ReserveRoomTime.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 08/08/24.
//


import SwiftUI

struct RoomReservationView: View {
    @State private var name: String = ""
    @State private var selectedShift: ShiftWork = .morning
    
    @State private var entryTimeIndex: Date = Calendar.current.date(
        bySettingHour: 8,
        minute: 0,
        second: 0, of: Date())!
    
    @State private var exitTimeIndex: Date = Calendar.current.date(
        bySettingHour: 9,
        minute: 0,
        second: 0, of: Date())!
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Reserva de Sala")
                .font(.largeTitle)
                .padding(.top, 20)
            
            TextField("Quem vai usar a sala?", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(.blue, lineWidth: 1)
                        .padding(.horizontal)
                )
            Picker("Escolha seu Turno", selection: $selectedShift) {
                ForEach(ShiftWork.allCases) { shift in
                    Text(shift.rawValue).tag(shift)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            DatePicker(
                "Horário de Entrada",
                selection: $entryTimeIndex,
                in: selectedShift.timeRange,
                displayedComponents: .hourAndMinute
            )
            .onChange(of: entryTimeIndex) { _, newValue in
                adjustEntryTime(newValue)
            }
            .datePickerStyle(.stepperField)
            .hLeading()
            .padding(.horizontal)
            
            DatePicker(
                "Horário de Saída",
                selection: $exitTimeIndex,
                in: entryTimeIndex...selectedShift.timeRange.upperBound,
                displayedComponents: .hourAndMinute
            )
            .padding(.horizontal)
            .onChange(of: exitTimeIndex) { _, newValue in
                adjustExitTime(newValue)
            }
            .datePickerStyle(.stepperField)
            .hLeading()
            
            Spacer()
            
            Button(action: {
                reserveRoom()
            }) {
                Text("Reservar Sala")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
    }
    
    func adjustTimesForShift() {
        let calendar = Calendar.current
        
        // Atualiza os horários de entrada e saída com base no turno selecionado
        entryTimeIndex = selectedShift.timeRange.lowerBound
        exitTimeIndex = calendar.date(byAdding: .hour, value: 1, to: entryTimeIndex)!
    }
    
    func adjustEntryTime(_ newValue: Date) {
        // Ajusta o horário de entrada para garantir que esteja dentro do intervalo e antes do horário de saída
        if newValue >= exitTimeIndex {
            entryTimeIndex = Calendar.current.date(
                bySettingHour: Calendar.current.component(.hour, from: exitTimeIndex),
                minute: Calendar.current.component(.minute, from: exitTimeIndex) - 15,
                second: 0,
                of: exitTimeIndex)!
        }
    }
    
    func adjustExitTime(_ newValue: Date) {
        // Ajusta o horário de saída para garantir que esteja dentro do intervalo e após o horário de entrada
        if newValue <= entryTimeIndex {
            exitTimeIndex = Calendar.current.date(
                bySettingHour: Calendar.current.component(.hour, from: entryTimeIndex),
                minute: Calendar.current.component(.minute, from: entryTimeIndex) + 15,
                second: 0,
                of: entryTimeIndex)!
        }
    }
    
//    func adjustEntryTime(_ newValue: Date) {
//        if newValue >= exitTimeIndex {
//            entryTimeIndex = Calendar.current.date(
//                bySettingHour: Calendar.current.component(.hour, from: exitTimeIndex),
//                minute: Calendar.current.component(.minute, from: exitTimeIndex) - 15,
//                second: 0,
//                of: exitTimeIndex)!
//        }
//    }
//    
//    func adjustExitTime(_ newValue: Date) {
//        if newValue <= entryTimeIndex {
//            exitTimeIndex = Calendar.current.date(
//                bySettingHour: Calendar.current.component(.hour, from: entryTimeIndex),
//                minute: Calendar.current.component(.minute, from: entryTimeIndex) + 15,
//                second: 0,
//                of: entryTimeIndex)!
//        }
//    }
    
    func reserveRoom() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let entryTimeString = formatter.string(from: entryTimeIndex)
        let exitTimeString = formatter.string(from: exitTimeIndex)
        print("Sala reservada por \(name) das \(entryTimeString) às \(exitTimeString)")
    }
}

#Preview {
    RoomReservationView()
}

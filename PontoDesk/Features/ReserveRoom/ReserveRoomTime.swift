//
//  ReserveRoomTime.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 08/08/24.
//


import SwiftUI

struct ReserveRoomTime: View {
    @State private var name: String = ""
    @State private var selectedShift: ShiftWork = .morning
    @State private var entryTimeIndex: Date = Date()
    
    @State private var exitTimeIndex: Date = Calendar.current.date(
        bySettingHour: 9,
        minute: 0,
        second: 0, of: Date())!
    
    var onReserve: (Reservation) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Reservar para Hoje")
                .font(.largeTitle)
                .padding(.top, 20)
            
            TextField("Quem vai usar a sala?", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(.blue, lineWidth: 0.5)
                        .padding(.horizontal)
                )
            
            
            Picker("", selection: $selectedShift) {
                ForEach(ShiftWork.allCases) { shift in
                    Text(shift.rawValue).tag(shift)
                }
            }
            .onChange(of: selectedShift) { _, _ in
                adjustTimesForShift()
            }
            .pickerStyle(.segmented)
            .tint(.blue)
            .padding(.horizontal, 6)
            .padding(.trailing, 6)
            
            DatePicker(
                "Horário de Entrada",
                selection: $entryTimeIndex,
                in: selectedShift.timeRange,
                displayedComponents: .hourAndMinute
            )
            .onChange(of: selectedShift) { _, _ in
                adjustTimesForShift()
            }
            
            .onChange(of: entryTimeIndex) { _, newValue in
                entryTimeIndex = Date()
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
            .onChange(of: exitTimeIndex) { _, newValue in
                adjustExitTime(newValue)
            }
            .padding(.horizontal)
            .datePickerStyle(.stepperField)
            .hLeading()
            
            Spacer()
            
            Button(action: {
                let reservation = Reservation(name: name, entryTime: entryTimeIndex, exitTime: exitTimeIndex)
                onReserve(reservation)
                reserveRoom()
            }) {
                Text("Reservar Sala")
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            .buttonStyle(PlainButtonStyle())
            
        }
        .background(Color("bg-dark-blue"))
        .preferredColorScheme(.dark)
    }
    
    func adjustTimesForShift() {
        let calendar = Calendar.current
        entryTimeIndex = Date()
        
        if !selectedShift.timeRange.contains(entryTimeIndex) {
            entryTimeIndex = selectedShift.timeRange.lowerBound
        }
        
        if exitTimeIndex < entryTimeIndex || !selectedShift.timeRange.contains(exitTimeIndex) {
            exitTimeIndex = calendar.date(byAdding: .hour, value: 1, to: entryTimeIndex) ?? selectedShift.timeRange.upperBound
        }
    }
    
    func adjustEntryTime(_ newValue: Date) {
        if newValue >= exitTimeIndex {
            entryTimeIndex = Calendar.current.date(
                byAdding: .minute,
                value: -15,
                to: exitTimeIndex
            ) ?? selectedShift.timeRange.lowerBound
        }
    }
    
    func adjustExitTime(_ newValue: Date) {
        if newValue <= entryTimeIndex {
            exitTimeIndex = Calendar.current.date(
                byAdding: .minute,
                value: 15,
                to: entryTimeIndex
            ) ?? selectedShift.timeRange.upperBound
        }
        
        if newValue > selectedShift.timeRange.upperBound {
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
    }
    
}

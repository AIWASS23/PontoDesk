//
//  ReserveRoomTime.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 08/08/24.
//

import SwiftUI

struct ReserveRoomTime: View {
    @ObservedObject var viewModel: ReserveRoomTimeViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Reservar para Hoje")
                .font(.largeTitle)
                .padding(.top, 20)
            
            TextField("Quem vai usar a sala?", text: $viewModel.name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(.blue, lineWidth: 0.5)
                        .padding(.horizontal)
                )
            
            Picker("", selection: $viewModel.selectedShift) {
                ForEach(ShiftWork.allCases) { shift in
                    Text(shift.rawValue).tag(shift)
                }
            }
            .onChange(of: viewModel.selectedShift) { _, _ in
                viewModel.adjustTimesForShift()
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 6)
            .padding(.trailing, 6)
            
            DatePicker(
                "Escolha o dia",
                selection: $viewModel.reservationDate,
                in: Date()...,
                displayedComponents: .date
            )
            .padding(.horizontal)
            .datePickerStyle(.stepperField)
            .hLeading()
            
            DatePicker(
                "Horário de Entrada",
                selection: $viewModel.entryTimeIndex,
                in: viewModel.selectedShift.timeRange,
                displayedComponents: .hourAndMinute
            )
            .onChange(of: viewModel.entryTimeIndex) { _, newValue in
                viewModel.adjustEntryTime(newValue)
            }
            .datePickerStyle(.stepperField)
            .hLeading()
            .padding(.horizontal)
            
            
            DatePicker(
                "Horário de Saída",
                selection: $viewModel.exitTimeIndex,
                in: (viewModel.entryTimeIndex <= viewModel.selectedShift.timeRange.upperBound ? viewModel.entryTimeIndex : viewModel.selectedShift.timeRange.upperBound)...viewModel.selectedShift.timeRange.upperBound,
                displayedComponents: .hourAndMinute
            )
            .onChange(of: viewModel.exitTimeIndex) { _, newValue in
                viewModel.adjustExitTime(newValue)
            }
            .padding(.horizontal)
            .datePickerStyle(.stepperField)
            .hLeading()

            
            Spacer()
            
            Button(action: {
                viewModel.reserveRoom()
            }) {
                Text("Reservar Sala")
                    .padding()
                    .background(viewModel.isReserveButtonDisabled ? Color.gray : Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            .buttonStyle(PlainButtonStyle())
            .disabled(viewModel.isReserveButtonDisabled)
        }
        .background(Color("bg-dark-blue"))
        .preferredColorScheme(.dark)
    }
}

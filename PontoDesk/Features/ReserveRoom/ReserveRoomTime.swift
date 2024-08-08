//
//  ReserveRoomTime.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 08/08/24.
//

//
//import SwiftUI
//
//struct RoomReservationView: View {
//    @State private var name: String = ""
//    @State private var entryTimeIndex: Date = .now
//    @State private var exitTimeIndex = Date()
//    @State var selectedDate: Date = .now
//    @State private var alarm = Date()
//
//    let times: [String] = {
//        var timesArray = [String]()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm"
//        var date = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
//        let endDate = Calendar.current.date(bySettingHour: 22, minute: 0, second: 0, of: Date())!
//        while date <= endDate {
//            timesArray.append(formatter.string(from: date))
//            date = Calendar.current.date(byAdding: .minute, value: 15, to: date)!
//        }
//        return timesArray
//    }()
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Reserva de Sala")
//                .font(.largeTitle)
//                .padding(.top, 20)
//
//            TextField("Quem vai usar a sala?", text: $name)
//                .textFieldStyle(.roundedBorder)
//                .padding(.horizontal)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 7)
//                        .stroke(.blue, lineWidth: 1)
//                        .padding(.horizontal)
//                )
//
//            //            Picker("Horário de Entrada", selection: $entryTimeIndex) {
//            //                ForEach(0..<times.count, id: \.self) {
//            //                    Text(self.times[$0])
//            //                }
//            //            }
//            //            .padding(.horizontal)
//            //            .onChange(of: entryTimeIndex) { _, newValue in
//            //                adjustEntryTime(newValue)
//            //            }
//            //            .overlay(
//            //                RoundedRectangle(cornerRadius: 7)
//            //                    .stroke(.blue, lineWidth: 1)
//            //                    .padding(.horizontal)
//            //            )
//            //
//            //            Picker("Horário de Saída", selection: $exitTimeIndex) {
//            //                ForEach(0..<times.count, id: \.self) {
//            //                    Text(self.times[$0])
//            //                }
//            //            }
//            //            .padding(.horizontal)
//            //            .onChange(of: exitTimeIndex) { _, newValue in
//            //                adjustExitTime(newValue)
//            //            }
//            //            .overlay(
//            //                RoundedRectangle(cornerRadius: 7)
//            //                    .stroke(.blue, lineWidth: 1)
//            //                    .padding(.horizontal)
//            //            )
//
//
//
//            DatePicker("Horário de Entrada",
//                       selection: $entryTimeIndex,
//                       displayedComponents: .hourAndMinute
//            )
//            .padding(.horizontal)
//            .hLeading()
//            .datePickerStyle(.stepperField)
//
//            DatePicker("Horário de Saída",
//                       selection: $exitTimeIndex,
//                       displayedComponents: .hourAndMinute
//            )
//            .padding(.horizontal)
//            .hLeading()
//            .datePickerStyle(.stepperField)
//
//
//            Spacer()
//
//            Button(action: {
//                //reserveRoom()
//            }) {
//                Text("Reservar Sala")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//            .padding(.bottom, 20)
//        }
//    }
////
////    func adjustEntryTime(_ newValue: Int) {
////        if newValue >= exitTimeIndex {
////            entryTimeIndex = exitTimeIndex - 1
////        }
////    }
////
////    func adjustExitTime(_ newValue: Int) {
////        if newValue <= entryTimeIndex {
////            exitTimeIndex = entryTimeIndex + 1
////        }
////    }
////
////    func reserveRoom() {
////        let entryTimeString = times[entryTimeIndex]
////        let exitTimeString = times[exitTimeIndex]
////        print("Sala reservada por \(name) das \(entryTimeString) às \(exitTimeString)")
////    }
//}
//
//#Preview {
//    RoomReservationView()
//}

import SwiftUI

struct RoomReservationView: View {
    @State private var name: String = ""
    @State private var entryTimeIndex: Date = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
    @State private var exitTimeIndex: Date = Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!
    
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
            
            DatePicker("Horário de Entrada",
                       selection: $entryTimeIndex,
                       in: Date()...,
                       displayedComponents: .hourAndMinute
            )
            .padding(.horizontal)
            .onChange(of: entryTimeIndex) { _, newValue in
                adjustEntryTime(newValue)
            }
            .datePickerStyle(.stepperField)
            
            DatePicker("Horário de Saída",
                       selection: $exitTimeIndex,
                       in: entryTimeIndex...,
                       displayedComponents: .hourAndMinute
            )
            .padding(.horizontal)
            .onChange(of: exitTimeIndex) { _, newValue in
                adjustExitTime(newValue)
            }
            .datePickerStyle(.stepperField)
            
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
    
    func adjustEntryTime(_ newValue: Date) {
        if newValue >= exitTimeIndex {
            entryTimeIndex = Calendar.current.date(bySettingHour: Calendar.current.component(.hour, from: exitTimeIndex),
                                                   minute: Calendar.current.component(.minute, from: exitTimeIndex) - 15,
                                                   second: 0,
                                                   of: exitTimeIndex)!
        }
    }
    
    func adjustExitTime(_ newValue: Date) {
        if newValue <= entryTimeIndex {
            exitTimeIndex = Calendar.current.date(bySettingHour: Calendar.current.component(.hour, from: entryTimeIndex),
                                                  minute: Calendar.current.component(.minute, from: entryTimeIndex) + 15,
                                                  second: 0,
                                                  of: entryTimeIndex)!
        }
    }
    
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

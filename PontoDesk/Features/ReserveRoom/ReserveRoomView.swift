//
//  ReserveRoomView.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 13/08/24.
//
//


import SwiftUI

struct ReserveRoomView: View {
    
    @State private var date = Date()
    @State private var reservations: [Reservation] = []
    @ObservedObject var dayViewModel = ReserveRoomDayViewModel()
    
    
    var body: some View {
        VStack {
            ReserveRoomDay(
                date: $dayViewModel.date,
                dayOfWeek: dayViewModel.dayOfWeek,
                formattedDate: dayViewModel.formattedDate,
                onPreviousDate: {
                    dayViewModel.date = Calendar.current.date(byAdding: .day, value: -1, to: dayViewModel.date) ?? dayViewModel.date
                },
                onNextDate: {
                    dayViewModel.date = Calendar.current.date(byAdding: .day, value: 1, to: dayViewModel.date) ?? dayViewModel.date
                },
                isPreviousButtonEnabled: dayViewModel.isPreviousButtonEnabled
            )
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
            
            Text("Reservas do Dia")
                .font(.system(size: 60))
                .padding(.leading)
                .hLeading()
                .foregroundStyle(.bgDarkBlue)
            
            HStack(alignment: .top) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(filteredReservations) { reservation in
                            ReserveRoomCard(reservation: reservation)
                        }
                        Spacer()
                    }
                    .padding()
                }
                .frame(width: 400, height: 300)
                
                let viewModel = ReserveRoomTimeViewModel(onReserve: { reservation in
                    reservations.append(reservation)
                })
                
                ReserveRoomTime(viewModel: viewModel)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 400)
                    .padding()
                    .hTrailing()
            }
            .padding()
        }
        .background(Color("bg-screen"))
    }
        
    
    var filteredReservations: [Reservation] {
        reservations.filter { reservation in
            Calendar.current.isDate(reservation.entryTime, inSameDayAs: dayViewModel.date)
        }
    }
}

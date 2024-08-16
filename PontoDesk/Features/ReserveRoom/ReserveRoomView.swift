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
            .background(Color.gray.opacity(0.2))
            
            HStack {
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
                    .frame(width: 400)
                    .padding()
            }
            .padding()
        }
    }
    
    var filteredReservations: [Reservation] {
        reservations.filter { reservation in
            Calendar.current.isDate(reservation.entryTime, inSameDayAs: dayViewModel.date)
        }
    }
}

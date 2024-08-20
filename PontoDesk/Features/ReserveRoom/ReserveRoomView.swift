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
        GeometryReader { geometry in
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
                .frame(maxWidth: .infinity, maxHeight: 56) 
                .padding([.top, .bottom], geometry.size.height * 0.02)
                
                Text("Reservas do Dia")
                    .font(.system(size: geometry.size.width * 0.03))
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .padding([.top, .bottom], geometry.size.height * 0.01)
                    .padding([.leading, .trailing], geometry.size.width * 0.02)
                    .hLeading()
                    .foregroundStyle(.bgDarkBlue)
                
                HStack(alignment: .top) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(filteredReservations) { reservation in
                                ReserveRoomCard(reservation: reservation)
                                    .frame(width: geometry.size.width * 0.65 - 30)
                                    .padding(.leading, geometry.size.height * 0.01)
                            }
                            Spacer()
                        }
                        .padding([.top, .bottom], geometry.size.height * 0.01)
                        .padding([.leading, .trailing], geometry.size.width * 0.01)
                    }
                    .frame(width: geometry.size.width * 0.65, height: geometry.size.height * 0.7)
                    
                    let viewModel = ReserveRoomTimeViewModel(onReserve: { reservation in
                        reservations.append(reservation)
                    })
                    
                    ReserveRoomTime(viewModel: viewModel)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: geometry.size.width * 0.3)
                        .padding(.bottom, geometry.size.height * 0.01)
                        .hTrailing()
                }
                .padding([.bottom, .trailing], geometry.size.height * 0.01)
            }
            .background(Color("bg-screen"))
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    var filteredReservations: [Reservation] {
        reservations.filter { reservation in
            Calendar.current.isDate(reservation.entryTime, inSameDayAs: dayViewModel.date)
        }
    }
}


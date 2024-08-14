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
    
    var body: some View {
        VStack {
            // Calendar at the top center
            ReserveRoomDay(
                date: $date,
                dayOfWeek: "Tuesday",
                formattedDate: "13 August 2024",
                onPreviousDate: { /* Handle previous date */ },
                onNextDate: { /* Handle next date */ },
                isAdvanceButtonEnabled: true
            )
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
            .background(Color.gray.opacity(0.2))
            
            HStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(reservations) { reservation in
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
}


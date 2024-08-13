//
//  ReserveRoomView.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 13/08/24.
//

import SwiftUI


struct ReserveRoomView: View {
    @State private var date = Date()
    @State private var reservations: [Reservation] = []
    
    var body: some View {
        VStack {
            // Calendar at the top center
            NavigationDateView(
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
                // Reservation cards on the left
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(reservations) { reservation in
                        ReserveRoomCard(reservation: reservation)
                    }
                    Spacer()
                }
                .padding()
                
                // Room reservation component on the right
                ReserveRoomTime(
                    onReserve: { reservation in
                        reservations.append(reservation)
                    }
                )
                .frame(width: 400)
                .padding()
            }
            .padding()
        }
    }
}


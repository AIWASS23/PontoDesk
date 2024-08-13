//
//  ReserveRoomCard.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 13/08/24.
//

import SwiftUI

struct ReserveRoomCard: View {
    let reservation: Reservation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(reservation.name)")
                .font(.headline)
                .padding([.leading, .trailing])
            HStack {
                Image(systemName: "clock")
                Text("De \(formatTime(reservation.entryTime)) às \(formatTime(reservation.exitTime))")
            }
            .padding([.leading, .trailing])
        }
        .background(Color("bg-dark-blue"))
        .preferredColorScheme(.dark)
        .cornerRadius(10)
    }
    
    func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}

#Preview {
    ReserveRoomCard(reservation: Reservation(name: "Marcelo", entryTime: Date(), exitTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!))
}


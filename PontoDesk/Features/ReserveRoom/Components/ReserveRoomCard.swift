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
        VStack(alignment: .leading) {
            Text("\(reservation.name)")
                .font(.system(size: 30))
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            HStack {
                Image(systemName: "clock")
                    .font(.system(size: 25))
                    .minimumScaleFactor(0.1)
                
                Text("De \(formatTime(reservation.entryTime)) às \(formatTime(reservation.exitTime))")
                    .font(.system(size: 25))
                    .lineLimit(1)
                    .minimumScaleFactor(0.2)
            }
        }
        .padding()
        .frame(minWidth: 368, maxWidth: .infinity, minHeight: 124, maxHeight: .infinity)
        .background(Color("bg-dark-blue"))
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

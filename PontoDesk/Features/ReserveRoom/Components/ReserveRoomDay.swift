//
//  ReserveRoomDay.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 13/08/24.
//

import SwiftUI

struct ReserveRoomDay: View {
    
    @Binding var date: Date
    var dayOfWeek: String
    var formattedDate: String
    var onPreviousDate: () -> Void
    var onNextDate: () -> Void
    var isPreviousButtonEnabled: Bool
    
    var body: some View {
        
        HStack( alignment: .center)  {
            Button(action: {
                onPreviousDate()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 38, weight: .bold))
                    .padding()
                    .foregroundColor(isPreviousButtonEnabled ? Color.bgDarkBlue : Color.gray)
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(!isPreviousButtonEnabled)
            
            VStack {
               
                Text(dayOfWeek.capitalized)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.bgDarkBlue)
                   
                Text(formattedDate)
                    .font(.title)
                    .foregroundColor(.bgDarkBlue)
                    .fontWeight(.semibold)
                    .padding([.trailing, .leading], 10)
                  
            }
         .frame(minWidth: 330, minHeight: 56)
         
            Button(action: {
                onNextDate()
            }) {
                Image(systemName: "chevron.right")
                    .padding()
                    .font(.system(size: 38, weight: .bold))
                    .foregroundColor(Color.bgDarkBlue)
                
            }
                .buttonStyle(PlainButtonStyle())
        }
        .frame(minWidth: 365, minHeight: 56)
        .padding()
    }
}

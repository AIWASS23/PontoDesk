//
//  NavigationDateView.swift
//  PontoDesk
//
//  Created by Ricardo Silva Vale on 09/08/24.
//

import SwiftUI

struct NavigationDateView: View {
    
    @Binding var date: Date
    var dayOfWeek: String
    var formattedDate: String
    var onPreviousDate: () -> Void
    var onNextDate: () -> Void
    var isAdvanceButtonEnabled: Bool
    var body: some View {
        
        HStack( alignment: .center)  {
            Button(action: {
                onPreviousDate()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 38, weight: .bold))
                    .padding()
                    .foregroundColor(.bgDarkBlue)
            }
           .buttonStyle(PlainButtonStyle())
            
            VStack (alignment: .center){
               
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
                    .foregroundColor(isAdvanceButtonEnabled ? Color.bgDarkBlue : Color.gray)
                
            }
                .buttonStyle(PlainButtonStyle())
                .disabled(!isAdvanceButtonEnabled)
        }
        .frame(minWidth: 365, minHeight: 56)
        .padding()
    }
}

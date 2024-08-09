//
//  Point.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct PointView: View {
    @StateObject private var viewModel = ComponentsPointViewModel()
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
                NavigationDateView(
                       date: $viewModel.date,
                       dayOfWeek: viewModel.dayOfWeek,
                       formattedDate: viewModel.formattedDate,
                       onPreviousDate: {
                           if let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: viewModel.date) {
                               let calendar = Calendar.current
                               var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: previousDate)
                               components.hour = calendar.component(.hour, from: viewModel.date)
                               components.minute = calendar.component(.minute, from: viewModel.date)
                               components.second = calendar.component(.second, from: viewModel.date)
                               viewModel.date = calendar.date(from: components) ?? viewModel.date
                           }
                           viewModel.stateButton.bool3 = false
                       },
                       onNextDate: {
                           if let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: viewModel.date), nextDate <= Date() {
                               viewModel.date = nextDate
                           }
                       },
                       isAdvanceButtonEnabled: !viewModel.stateButton.bool3
                   )
        
         VStack (alignment: .leading){
                   Text("Olá, Marcos Daniel!")
                       .font(.largeTitle)
                       .fontWeight(.light)
                       .foregroundColor(.bgDarkBlue)
                       .padding([.trailing, .leading], 10)
                       .lineLimit(1)
                       .padding(.bottom, 5)
                
                 Text("Seja bem-vindo!")
                     .font(.title2)
                     .fontWeight(.bold)
                     .foregroundColor(.bgDarkBlue)
                     .padding([.trailing, .leading], 10)
                     .padding(.bottom, 25)
                     .border(Color.red)
                     
            }
            //Registro de Ponto
            VStack{
                HStack{
                    
                }
                
                
            }
                       // Resto do código da view PontoView...
                       // Botões de Ponto Entrada e Ponto Saída, etc.
            
            
             .frame(width: 600, alignment: .leading)
            
            }
               .onAppear {
                   viewModel.updateDateInfo()
                   viewModel.checkAdvanceButtonState()
               }
               .onReceive(timer) { _ in
                   viewModel.updateTimeOnly()
               }.background(.bgScreen)
    }
        
}

#Preview {
    PointView()
}

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
                    guard let previousDate =
                            Calendar.current.date(
                                byAdding: .day,
                                value: -1,
                                to: viewModel.date) else { return }
                    viewModel.date = previousDate
                    
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
                //Registro de Ponto
        PointRegister()
                    .environmentObject(viewModel)
          
            }
            
            .padding([.leading, .trailing], 16)
            
            Spacer()
                .onAppear {
                    viewModel.updateDateInfo()
                    viewModel.checkAdvanceButtonState()
                }
            
                .onReceive(timer) { _ in
                    viewModel.updateTimeOnly()
                    
                }
            
        }.background(.bgScreen)
        
    } 
    
}
#Preview {
    PointView()
}

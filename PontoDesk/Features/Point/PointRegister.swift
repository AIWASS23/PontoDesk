//
//  PointRegister.swift
//  PontoDesk
//
//  Created by Ricardo Silva Vale on 13/08/24.
//

import SwiftUI

struct PointRegister: View {
    @EnvironmentObject private var viewmodel:  ComponentsPointViewModel
    
    
    var body: some View {
        VStack{
            VStack (alignment: .leading){
                Text("Olá, Marcos Daniel!")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.bgDarkBlue)
                    .padding([.trailing, .leading], 40)
                    .lineLimit(1)
                    .padding([.bottom,.top], 5)
                
                
                Text("Seja bem-vindo!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.bgDarkBlue)
                    .padding([.trailing, .leading], 40)
                    .padding(.bottom, 25)
            }
            
            .frame(maxWidth: .infinity,   alignment: .leading)
            .background(.bgScreen)
            
            
            VStack (alignment: .leading){
                //Registro de Ponto
                //Botão de Entrada
                HStack (alignment: .center){
                    Button(action: {
                        DispatchQueue.main.async {
                            Task{
                                viewmodel.dataInicial = Date()
                                guard let dataInicial = viewmodel.dataInicial else { return }
                                viewmodel.dataEntrada = String(" \(viewmodel.formatDatePonto(date: dataInicial))")
                                viewmodel.horaEntrada = String(viewmodel.formatHourPonto(date: dataInicial))
                                viewmodel.stateButton.btentrada.toggle()
                                viewmodel.stateButton.btsaída = false
                                
                                let savedDate = await viewmodel.clockIn()
                                
                            }
                        }
                        
                    }) {
                        Rectangle()
                            .foregroundColor(viewmodel.stateButton.btentrada ? Color.gray : Color.bgDarkBlue)
                            .frame(width: 64, height: 64)
                            .cornerRadius(10)
                            .overlay(
                                Image("ponto-entrada")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)

                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(viewmodel.stateButton.btentrada)
                
                    
                    // Bloco de informações de entrada
                    
                    VStack (alignment: .leading){
                        Text(viewmodel.stateButton.btentrada ? "Ponto de Entrada Registrado" : "Ponto de Entrada")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        HStack{
                            Label("-", systemImage: "calendar")
                                .font(.title)
                                .foregroundColor(viewmodel.stateButton.btentrada ? Color.white : Color.bgLightBlue)
                            Text(viewmodel.dataEntrada)
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.ultraLight)
                            Label("-", systemImage: "clock")
                                .font(.title3)
                                .foregroundColor(viewmodel.stateButton.btentrada ? Color.white : Color.bgLightBlue)
                            Text(viewmodel.horaEntrada)
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.ultraLight)
                        }
                    }
                    .frame(width: 300, height: 64)
                    .background(viewmodel.stateButton.btentrada ? Color.gray : Color.bgDarkBlue)
                    .opacity(viewmodel.stateButton.btentrada ? 0.8 : 1.0)
                    .cornerRadius(10)
                    .padding()
                }
                .padding(.leading, 40)
                // Bater Ponto de Saída
                //Botão de Saída
                HStack{
                    
                    Button(action: {
                        DispatchQueue.main.async {
                            Task{
                                viewmodel.dataFinal = Date()
                                guard let dataFinal = viewmodel.dataFinal else { return }
                                viewmodel.dataSaida = String("\(viewmodel.formatDatePonto(date: dataFinal))")
                                viewmodel.horaSaida = String(viewmodel.formatHourPonto(date: dataFinal))
                                viewmodel.stateButton.btsaída.toggle()
                                viewmodel.totalHorasEMinutos = viewmodel.calculateTimeDifference(start: viewmodel.dataInicial!, end: dataFinal)
                                viewmodel.stateButton.stsaida = true
                                await viewmodel.clockOut()
                            }
                        }
                        
                        
                    }) {
                        Rectangle()
                            .foregroundColor(viewmodel.stateButton.btsaída ? Color.gray : Color.bgDarkBlue )
                            .frame(width: 64, height: 64)
                            .cornerRadius(10)
                            .overlay(
                                Image("ponto-saida")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(viewmodel.stateButton.btsaída)
                   
                    // Bloco de informações de saida
                    
                    VStack (alignment: .leading){
                        Text(viewmodel.stateButton.stsaida ? "Ponto de Saída Registrado" : "Ponto de Saída" )
                            .font(.title)
                            .foregroundColor(.white)
                        
                        HStack{
                            Label("-", systemImage: "calendar")
                                .font(.title)
                                .foregroundColor(viewmodel.stateButton.btsaída ? Color.white : Color.bgLightBlue)
                            Text(viewmodel.dataSaida)
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.ultraLight)
                            Label("-", systemImage: "clock")
                                .font(.title3)
                                .foregroundColor(viewmodel.stateButton.btsaída ? Color.white : Color.bgLightBlue)
                            Text(viewmodel.horaSaida)
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.ultraLight)
                        }
                    }
                    .frame(width: 300, height: 64)
                    .background(viewmodel.stateButton.btsaída ? Color.gray : Color.bgDarkBlue)
                    .opacity(viewmodel.stateButton.btsaída ? 0.8 : 1.0)
                    .cornerRadius(10)
                    .padding()
                }
                .padding([.leading, .trailing], 40)
                  
                VStack (alignment: .leading) {
                    Text("Total de Horas: \(viewmodel.totalHorasEMinutos)")
                        .font(.title2)
                        .foregroundColor(.bgDarkBlue)
                        .padding([.leading, .trailing], 40)
                        .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .leading)
                
                
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .background(.bgScreen)
        .onAppear{
            let dispatchSession = DispatchQueue(label: "session", attributes: .concurrent, target: .global(qos: .default))
            dispatchSession.async {
                Task{
                    
                    guard let result = await viewmodel.getCurrentClock() else { return }
                    
                    let clock = result.result
                    
                    guard let entry = clock.entry else { viewmodel.stateButton.btsaída = false; return }
                    DispatchQueue.main.async {
                        guard let dataInicial = entry.toDate() else { return }
                        print(dataInicial)
                        viewmodel.dataInicial = dataInicial
                        guard let dataInicial = viewmodel.dataInicial else { return }
                        viewmodel.dataEntrada = String(" \(viewmodel.formatDatePonto(date: dataInicial))")
                        viewmodel.horaEntrada = String(viewmodel.formatHourPonto(date: dataInicial))
                        viewmodel.stateButton.btentrada.toggle()
                    }
                    guard let exit = clock.exit else { viewmodel.stateButton.btsaída = false ;  return }
                     
                    DispatchQueue.main.async {
                        guard let dataFinal = exit.toDate() else { return }
                        
                        viewmodel.dataFinal = dataFinal
                        guard let dataFinal = viewmodel.dataFinal else { return }
                        viewmodel.dataSaida = String(" \(viewmodel.formatDatePonto(date: dataFinal))")
                        viewmodel.horaSaida = String(viewmodel.formatHourPonto(date: dataFinal))
                        viewmodel.totalHorasEMinutos = viewmodel.calculateTimeDifference(start: viewmodel.dataInicial!, end: viewmodel.dataFinal!)
                        viewmodel.stateButton.stsaida = true
                    }
                    
                    
                }
            }
        }
    }
}
#Preview {
    PointRegister()
        .environmentObject(ComponentsPointViewModel())
}

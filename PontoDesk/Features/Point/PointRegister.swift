//
//  PointRegister.swift
//  PontoDesk
//
//  Created by Ricardo Silva Vale on 13/08/24.
//

import SwiftUI

struct PointRegister: View {
    @StateObject private var viewmodel = ComponentsPointViewModel()
    @AppStorage("userName") var userName: String = ""
    
    var body: some View {
        
        VStack{
            VStack (alignment: .leading){
                Text("Olá, \(userName)!")
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
            .accessibilityElement(children: .combine)
            .accessibilityRemoveTraits(.isStaticText)
            .frame(maxWidth: .infinity,   alignment: .leading)
            .background(.bgScreen)
            
            
            VStack (alignment: .leading){
                //Registro de Ponto
                //Botão de Entrada
                HStack (alignment: .center){
                    Button(action: {
                        viewmodel.dataInicial = Date()
                        guard let dataInicial = viewmodel.dataInicial else { return }
                        viewmodel.dataEntrada = String(" \(viewmodel.formatDatePonto(date: dataInicial))")
                        viewmodel.horaEntrada = String(viewmodel.formatHourPonto(date: dataInicial))
                        viewmodel.stateButton.btentrada.toggle()
                        viewmodel.stateButton.btsaída = false
                    }) {
                        Rectangle()
                            .foregroundColor(viewmodel.stateButton.btentrada ? Color.gray : Color.bgDarkBlue)
                            .frame(width: 90, height: 100)
                            .cornerRadius(10)
                            .overlay(
                                Image("ponto-entrada")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                            )
                        
                            .accessibilityLabel("Botão de Registro de Entrada")
                            .accessibilityHint(viewmodel.stateButton.btentrada ? "Ponto de Entrada já registrado" : "Clique para registrar o ponto de entrada")
                    }
                    .accessibilityRemoveTraits(.isButton)
                    .buttonStyle(PlainButtonStyle())
                    .disabled(viewmodel.stateButton.btentrada)
                    
                    
                    // Bloco de informações de entrada
                    
                    VStack (alignment: .leading){
                        Text(viewmodel.stateButton.btentrada ? "Ponto de Entrada Registrado" : "Ponto de Entrada")
                            .font(.title)
                            .foregroundColor(.white)
                            .accessibilityLabel(viewmodel.stateButton.btentrada ? "Status do Ponto de Entrada: Registrado" : "Status do Ponto de Entrada: Não Registrado")
                            .accessibilityRemoveTraits(.isStaticText)
                        
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
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Informações de Entrada")
                        .accessibilityValue("Data: \(viewmodel.dataEntrada), Hora: \(viewmodel.horaEntrada)")
                        .accessibilityRemoveTraits(.isStaticText)
                    }
                    .padding()
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
                        viewmodel.dataFinal = Date()
                        guard let dataFinal = viewmodel.dataFinal else { return }
                        viewmodel.dataSaida = String("\(viewmodel.formatDatePonto(date: dataFinal))")
                        viewmodel.horaSaida = String(viewmodel.formatHourPonto(date: dataFinal))
                        viewmodel.stateButton.btsaída.toggle()
                        viewmodel.totalHorasEMinutos = viewmodel.calculateTimeDifference(start: viewmodel.dataInicial!, end: dataFinal)
                        viewmodel.stateButton.stsaida = true
                        
                    }) {
                        Rectangle()
                            .foregroundColor(viewmodel.stateButton.btsaída ? Color.gray : Color.bgDarkBlue )
                            .frame(width: 90, height: 100)
                            .cornerRadius(10)
                            .overlay(
                                Image("ponto-saida")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                            )
                            .accessibilityLabel(viewmodel.stateButton.btsaída ? "Botão de Registro de Saída" : "Botão de Registro de Saída")
                            .accessibilityHint(viewmodel.stateButton.btsaída ? "" : "Clique para registrar o ponto de saída")
                    }
                    .accessibilityRemoveTraits(.isButton)
                    .buttonStyle(PlainButtonStyle())
                    .disabled(viewmodel.stateButton.btsaída)
                    
                    // Bloco de informações de saida
                    
                    VStack (alignment: .leading){
                        Text(viewmodel.stateButton.stsaida ? "Ponto de Saída Registrado" : "Ponto de Saída" )
                            .font(.title)
                            .foregroundColor(.white)
                            .accessibilityLabel(viewmodel.stateButton.stsaida ? "Status do Ponto de Saída: Registrado " : "Status do Ponto de Saída: Não Registrado")
                            .accessibilityRemoveTraits(.isStaticText)
                        
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
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Informações de Saída")
                        .accessibilityValue("Data: \(viewmodel.dataSaida), Hora: \(viewmodel.horaSaida)")
                        .accessibilityRemoveTraits(.isStaticText)
                        
                    }
                    .padding()
                    .background(viewmodel.stateButton.btsaída ? Color.gray : Color.bgDarkBlue)
                    .opacity(viewmodel.stateButton.btsaída ? 0.8 : 1.0)
                    .cornerRadius(10)
                    .padding()
                }
                .padding([.leading, .trailing], 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            VStack (alignment: .leading) {
                Text("Total de Horas: \(viewmodel.totalHorasEMinutos)")
                    .font(.title2)
                    .foregroundColor(.bgDarkBlue)
                    .padding([.leading, .trailing], 40)
                    .padding(.bottom, 20)
                    .accessibilityLabel("Total de Horas Trabalhadas")
                    .accessibilityValue("\(viewmodel.totalHorasEMinutos)")
                    .accessibilityRemoveTraits(.isStaticText)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .leading)
            
            
        }.background(.bgScreen)
            .accessibilityElement(children: .contain)
    }
    
}
#Preview {
    PointRegister()
}

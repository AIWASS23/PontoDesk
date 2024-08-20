//
//  SideBarLayout.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct SideBarLayout: View {
    @Binding var currentTab: TabOptions
    @State private var showLegend = false
    
    var size: CGSize
    var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            
            SideBarButton(buttonAction: {
                print("Eu funciono")
            }, showLegend: $showLegend, tabName: "PontoDesk", tabIcon: "clock-icon", currentTab: $currentTab)
            .accessibilityLabel("Botão para Ponto Desk")
            .accessibilityRemoveTraits(.isButton)
            
            Spacer()
            
            ForEach(TabOptions.allCases, id: \.rawValue) { tab in
                SideBarButton(buttonAction: {
                    currentTab = tab
                }, showLegend: $showLegend, tabName: tab.rawValue, tabIcon: tab.symbol, currentTab: $currentTab)
                .accessibilityLabel("Botão para \(tab.rawValue)")
                .accessibilityHint("Clique para selecionar \(tab.rawValue)")
                .accessibilityRemoveTraits(.isButton)
            }
            
            Spacer()
            
            SideBarButton(buttonAction: {
                loginViewModel.emptyToken()
            }, showLegend: $showLegend, tabName: "Logout", tabIcon: "logout-icon", currentTab: $currentTab)
            .accessibilityLabel("Botão para Sair")
            .accessibilityHint("Clique para sair do Aplicativo")
            .accessibilityRemoveTraits(.isButton)
            Spacer()
        }
        .frame(height: size.height)
        .animation(.snappy(duration: 0.28), value: currentTab)
        .buttonStyle(.plain)
        .padding(10)
        .background(Color.bgDarkBlue)
        .onHover { hovering in
            showLegend.toggle()
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Barra lateral de navegação")
        .accessibilityHint("Navegue pelas opções principais")
    }
}

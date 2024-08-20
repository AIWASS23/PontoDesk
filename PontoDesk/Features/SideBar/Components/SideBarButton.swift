//
//  SideBarButton.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct SideBarButton: View {
    var buttonAction: () -> ()
    @Binding var showLegend: Bool
    var tabName: String
    var tabIcon: String
    @Binding var currentTab: TabOptions
    
    init(buttonAction: @escaping () -> Void, showLegend: Binding<Bool>, tabName: String, tabIcon: String, currentTab: Binding<TabOptions>) {
        self.buttonAction = buttonAction
        self._showLegend = showLegend
        self.tabName = tabName
        self.tabIcon = tabIcon
        self._currentTab = currentTab
    }
    
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            HStack(alignment: .center){
                Image(tabIcon)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                
                if(showLegend){
                    Text(tabName)
                }
            }.padding(6)
                .background(currentTab.rawValue == tabName ? Color.bgLightBlue : Color.clear)
                .cornerRadius(12)
                .padding(10)
        }
        
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("Botão de seleção de aba: \(tabName)"))
        .accessibilityHint(Text("Toque para selecionar a aba \(tabName)"))
        .accessibilityRemoveTraits(currentTab.rawValue == tabName ? .isSelected : [])
    }
}

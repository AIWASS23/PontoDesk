//
//  SideBarButton.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct SideBarButton: View {
    @Binding var currentTab: TabOptions
    @Binding var showLegend: Bool
    
    var body: some View {
        
        ForEach(TabOptions.allCases, id: \.rawValue) { tab in
            Button {
                currentTab = tab
            } label: {
                HStack(alignment: .center){
                    Image(tab.symbol)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                    
                    if(showLegend){
                        Text(tab.rawValue)
                    }
                }.padding(6)
                    .background(currentTab == tab ? Color.bgLightBlue : Color.clear)
                    .cornerRadius(12)
                    .padding(10)
            }
            
        }
    }
}

struct SidebarUniqueItem: View {
    @Binding var showLegend: Bool
    var itemIcon: String
    var itemName: String
    
    var body: some View {
        HStack(alignment: .center){
            Image(itemIcon)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)

            if(showLegend){
                Text(itemName)
                    .padding(.leading, 6)
                    .font(.title3)
                
            }
        }.padding(16)
    }
}

//
//  ItemGroup.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import Foundation

struct ItemGroup: Identifiable {
    let id: String
    let header: String?
    let items: [Item]
    let isCollapsable: Bool
    
    init(id: String, 
         header: String? = nil,
         items: [Item],
         isCollapsable: Bool = true
    ){
        self.id = id
        self.header = header
        self.items = items
        self.isCollapsable = isCollapsable
    }
}

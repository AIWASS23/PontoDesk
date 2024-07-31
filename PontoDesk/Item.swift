//
//  Item.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct Item: Identifiable {
    let id: String
    let title: String
    let detailView: AnyView?
    let image: Image
    let defaultTitleColor: Color
    let selectionTextColor: Color
    let selectionBackground: AnyView
    let view: AnyView
    
    init(id: String,
         title: String,
         detailView: AnyView? = nil,
         image: Image,
         defaultTitleColor: Color = .primary,
         selectionTextColor: Color = .primary,
         selectionBackground: AnyView = AnyView(Color.blue),
         view: AnyView) {
        
        self.id = id
        self.title = title
        self.detailView = detailView
        self.image = image
        self.defaultTitleColor = defaultTitleColor
        self.selectionTextColor = selectionTextColor
        self.selectionBackground = selectionBackground
        self.view = view
    }
}

extension Item: Equatable, Hashable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
}

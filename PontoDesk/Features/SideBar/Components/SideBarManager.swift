//
//  SideBarManager.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 06/08/24.
//

import SwiftUI

struct SideBarManager<Content: View, T: Hashable>: View {
    var hideTabBar: Bool = true
    @Binding var selection: T
    @ViewBuilder var content: Content
    
    var body: some View {
        ScrollView(.init()){
            TabView(selection: $selection) {
                content
            }
            .background(TabFinder(hide: hideTabBar))
        }
    }
}

fileprivate struct TabFinder: NSViewRepresentable{
    var hide: Bool
    
    func updateNSView(_ nsView: NSViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            if let superView = nsView.superview?.superview {
                if let tabView = superView.subviews(type: NSTabView.self).first{
                    tabView.tabPosition = hide ? .none : .top
                    tabView.tabViewBorderType = hide ? .none : .bezel
                }
            }
        }
    }
    
    func makeNSView(context: Context) -> some NSView {
        return .init()
    }
}

fileprivate extension NSView{
    func subviews<Type: NSView>(type: Type.Type) -> [Type]{
        var views = subviews.compactMap({$0 as? Type})
        for subview in subviews{
            views.append(contentsOf: subview.subviews(type: type))
        }
        
        return views
    }
}

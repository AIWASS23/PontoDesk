//
//  TranslucentView.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 31/07/24.
//

import SwiftUI

struct TranslucentView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        view.isEmphasized = true
        view.material = material
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}

//
//  AccessorView.swift
//  PontoDesk
//
//  Created by marcelodearaujo on 19/08/24.
//

import SwiftUI

struct AccessorView: NSViewRepresentable {
    var configure: (NSWindow?) -> Void
    
    func makeNSView(context: Context) -> NSView {
        let nsView = NSView()
        DispatchQueue.main.async {
            if let window = nsView.window {
                configure(window)
            }
        }
        return nsView
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

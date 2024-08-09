//
//  LoginWebView.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 08/08/24.
//

import SwiftUI
import WebKit

struct LoginWebView: NSViewRepresentable {
    var url: URL
    
    func makeNSView(context: Context) -> WKWebView {
        let wb = WKWebView()
        let requestURL = URLRequest(url: url)
        wb.load(requestURL)
        
        return wb
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        let requestURL = URLRequest(url: url)
        nsView.load(requestURL)
    }
}

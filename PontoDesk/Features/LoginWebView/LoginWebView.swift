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
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.websiteDataStore = WKWebsiteDataStore.nonPersistent()
        let contentController = WKUserContentController()
        webConfiguration.userContentController = contentController
        let wb = WKWebView(frame: .zero, configuration: webConfiguration)
        
        let requestURL = URLRequest(url: url)
        wb.load(requestURL)
        
        return wb
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        let requestURL = URLRequest(url: url)
        nsView.load(requestURL)
    }
}

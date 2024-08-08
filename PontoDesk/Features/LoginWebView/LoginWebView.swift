//
//  LoginWebView.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 08/08/24.
//

import SwiftUI
import WebKit

struct LoginWebView: NSViewRepresentable {
    var url: String
    
    func makeNSView(context: Context) -> WKWebView {
        let wb = WKWebView()
        
        if let urlLogin = URL(string: url){
            let requestURL = URLRequest(url: urlLogin)
            wb.load(requestURL)
        }else{
            print("Cannot open passed URL.")
        }
        
        return wb
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        if let urlLogin = URL(string: url){
            let requestURL = URLRequest(url: urlLogin)
            nsView.load(requestURL)
        }else{
            print("Cannot open passed URL.")
        }
    }
}

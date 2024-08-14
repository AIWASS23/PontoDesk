//
//  GoogleURL.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 09/08/24.
//

import Foundation

struct GoogleURL: LoginPlataformProtocol {
    var scheme: String = "https"
    var host: String = "accounts.google.com"
    var path: String = "o/oauth2/v2/auth"
    var client_id: String
    var redirect_uri: String
    var scope: String = "umaUrlVemAqui"
    var response_type = "code"
    
    var url: URL? {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = [
            .init(name: "scope", value: scope),
            .init(name: "response_type", value: response_type),
            .init(name: "redirect_uri", value: redirect_uri),
            .init(name: "client_id", value: client_id)
        ]
        return component.url
    }
}

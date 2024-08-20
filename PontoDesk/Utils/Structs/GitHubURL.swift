//
//  GitHubURL.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 09/08/24.
//

import Foundation

struct GitHubURL: LoginPlataformProtocol {
    var scheme: String = "https"
    var host: String = "github.com"
    var path: String = "/login/oauth/authorize"
    var client_id: String
    var redirect_uri: String
    var scope: String = "user:email"
    
    var url: URL? {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = [
            .init(name: "client_id", value: client_id),
            .init(name: "redirect_uri", value: redirect_uri),
            .init(name: "scope", value: scope)
        ]
        return component.url
    }
}

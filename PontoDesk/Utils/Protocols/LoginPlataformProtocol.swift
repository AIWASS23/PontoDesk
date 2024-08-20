//
//  LoginPlataformProtocol.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 09/08/24.
//

import Foundation

protocol LoginPlataformProtocol{
    var scheme: String { get }
    var host: String { get set }
    var path: String { get set }
    var client_id: String { get set }
    var redirect_uri: String { get set }
    var scope: String { get set }
    
    var url: URL? { get }
}

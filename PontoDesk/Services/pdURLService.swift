//
//  pdURLService.swift
//  PontoDesk
//
//  Created by Marcos Bezerra on 16/08/24.
//

import Foundation

struct pdURLService{
    private var BASE_URI_ENDPOINT: URL{
        self.baseUrlComponent.url!
    }
    let auth: String
    
    private var baseUrlComponent: URLComponents{
        var component = URLComponents()
        component.scheme = "https"
        component.host = "ncvvjec7c7.execute-api.us-east-2.amazonaws.com"
        component.path = "/Prod"
        return component
    }
    
    
    
    func request(method: HttpMethods, path: String, params: [String: String]? = nil) async -> (Data?, URLResponse)?{
    
        var component = baseUrlComponent
        
        let queryItems: [URLQueryItem] = {
            var items: [URLQueryItem] = []
            guard let params = params else { return [] }
            for item in params{
                items.append(.init(name: item.key, value: item.value))
            }
            return items
        }()
        
        component.queryItems = queryItems
        component.path += path
        
        guard let url = component.url else { return nil }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["Authorization": auth]
        request.httpMethod = method.rawValue
        
        do{
            var (data, response ) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse{
                print(httpResponse.statusCode)
            }
            return (data, response)
        
        } catch let error{
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    
}

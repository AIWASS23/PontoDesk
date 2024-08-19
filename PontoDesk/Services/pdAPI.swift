//
//  pdAPI.swift
//  PontoDesk
//
//  Created by Marcos Bezerra on 16/08/24.
//

import Foundation

struct pdAPI{
    let token: String
    
    func doClockIn(userID ID: String) async -> Bool{
        let session = pdURLService(auth: self.token)
        guard let (_, _) = await session.request(method: .POST,
                                                        path: "/clock",
                                                        params: ["role": "1"]) else {
            return false
        }
        return true
    }
    
    func doClockOut(userID ID: String) async -> Bool{
        let session = pdURLService(auth: self.token)
        guard let (_, _) = await session.request(method: .POST,
                path: "/clock",
                params: ["role": "2"]) else {
            return false
        }
        return true
    }
     
    
    func getCurrentClock() async -> ClockTime?{
        let session = pdURLService(auth: self.token)
        guard let (result, _) = await session.request(
            method: .GET,
            path: "/clock",
            result: ClockTime.self,
            cachePolicy: .reloadIgnoringLocalCacheData) else {
            return nil
        }
        return result
    }
}

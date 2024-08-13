//
//  LoginViewModel.swift
//  PontoDesk
//
//  Created by Yasmin Carloto on 13/08/24.
//

import Foundation
import SwiftUI
import JWTDecode

struct LoginViewModel{
    @AppStorage("userToken") var userToken = ""
    @AppStorage("userName") var userName = ""

    func setToken(token: String){
        self.userToken = token
    }
    
    func emptyToken(){
        self.userToken = ""
    }
    
    private func decodeToken(token: String) -> (any JWT)?{
        do{
            let decodedJWT = try decode(jwt: token)
            return decodedJWT
        }catch {
            print("Deu erro")
            return nil
        }
    }
    
    func setName(){
        let decodedJWT = decodeToken(token: userToken)
        if let name = decodedJWT?.claim(name: "name").string {
            self.userName = name
            print(name)
        }
    }
}

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
    @AppStorage("userId") var userId = ""
    @AppStorage("userName") var userName = ""
    @AppStorage("userEmail") var userEmail = ""

    func setToken(token: String){
        self.userToken = token
        self.setUserInfo()
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
    
    private func setUserInfo(){
        let decodedJWT = decodeToken(token: userToken)
        if let name = decodedJWT?.claim(name: "name").string {
            self.userName = name
        }
        if let email = decodedJWT?.claim(name: "email").string {
            self.userEmail = email
        }
        if let id = decodedJWT?.claim(name: "sub").string {
            self.userId = id
        }
    }
}

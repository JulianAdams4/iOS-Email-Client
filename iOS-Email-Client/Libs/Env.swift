//
//  Env.swift
//  iOS-Email-Client
//
//  Created by Pedro Iñiguez on 10/2/18.
//  Copyright © 2018 Criptext Inc. All rights reserved.
//

import Foundation

struct Env {
    private static let production: Bool = {
        let dic = ProcessInfo.processInfo.environment
        if let force = dic["forceProduction"],
            force == "true" {
            return true
        }
        
        #if DEBUG
            return false
        #elseif SUPPORT
            return true
        #else
            return true
        #endif
    }()
    
    static var isProduction: Bool {
        return self.production
    }
    
    static var socketURL: String {
        return "wss://socket.criptext.com:3002"
    }
    
    static var domain: String {
        return "@criptext.com"
    }
    
    static var apiURL: String {
        return "https://api.criptext.com"
    }
}
//
//  Singleton.swift
//  Interview
//
//  Created by Gaurav Singh on 26/04/20.
//  Copyright © 2020 Gaurav Singh. All rights reserved.
//

import Foundation

class Singleton{
    
    static let shared = Singleton()
    private let serialQueue = DispatchQueue(label: "serialQueue")
    private init(){}
    
    private var dict:[String:Any] = [:]
    
    
    public func set(value:Any,key:String){
        
        serialQueue.sync {
             dict[key] = value
        }
       
    }
    
    public func object(key:String) -> Any?{
        serialQueue.sync {
             dict[key]
        }
       
    }

    public func reset(){
        dict.removeAll()
    }
    
}

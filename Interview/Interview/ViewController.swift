//
//  ViewController.swift
//  Interview
//
//  Created by Gaurav Singh on 25/04/20.
//  Copyright © 2020 Gaurav Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        macICanBuy(budget: 100, closure: { mac in
//          print("I can afford a \(mac)")
//        })
//
//
//        let obj = InterviewTest()
//        obj.name = "GAurav"
//        debugPrint("\(obj.fullMessage)")
        
        
        self.callSingleton()
        
        
    }

    
    func callSingleton(){
        
        
        let count = 10
        
        for index in 0...count{
            Singleton.shared.set(value: index, key: String(index))
        }
        
        DispatchQueue.concurrentPerform(iterations:count) { (index) in
            if let n = Singleton.shared.object(key: String(index)) as? Int{
                print(n)
            }
        }
        
        Singleton.shared.reset()
        
        
        DispatchQueue.concurrentPerform(iterations:count) { (index) in

            Singleton.shared.set(value:index,key:String(index))

        }
        
    }
    
    func macICanBuy(budget: Int, closure: (String) -> Void) {
      print("checking budget...")
      
      // execute the closure 2 seconds after current time
        check { (success) in
            closure("16 Inch Mac")
        }
      
      print("macICanBuy finished execution")
    }
    
    func check( _ closure: (Bool) -> Void){
        
        closure(true)
        
    }
}



class InterviewTest {
    
    var name: String?
    
    lazy var greeting : String = { return "Hello \(self.name ?? "")" }()
    
    var fullMessage: String{
        get{
            return name ?? "" + greeting
        }
    }
    
}

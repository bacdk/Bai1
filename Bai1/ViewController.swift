//
//  ViewController.swift
//  Bai1
//
//  Created by Cntt20 on 7/5/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //
    var inactiveQueue:DispatchQueue!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Dùng Dispatch Queue
    @IBAction func phuongAn1(_ sender: Any) {
        let anotherQueue = DispatchQueue(label: "anotherQueue", qos: .utility, attributes: .concurrent)
        inactiveQueue = anotherQueue
        anotherQueue.async {
            for i in 0..<10
            {
                print("🔴",i)
            }
        }
        anotherQueue.async {
            for i in 100..<110
            {
                print("🔵",i)
            }
        }
        anotherQueue.async {
            for i in 1000..<1010
            {
                print("⚫",i)
            }
        }

    }
    
    //Dùng DispatchQoS
    @IBAction func phuongAn2(_ sender: Any) {
        let queue1 = DispatchQueue(label: "queue1", qos: .utility, attributes: [.concurrent, .initiallyInactive])
        let queue2 = DispatchQueue(label: "queue2", qos: .utility, attributes: [.concurrent, .initiallyInactive])
        let queue3 = DispatchQueue(label: "queue3", qos: .utility, attributes: [.concurrent, .initiallyInactive])
        //
        queue1.activate()
        queue2.activate()
        queue3.activate()
        //
        queue1.async {
            for i in 0..<10
            {
                print("🔴",i)
            }
        }
        queue2.async {
            for i in 100..<110
            {
                print("🔵",i)
            }
        }
        queue3.async {
            for i in 1000..<1010
            {
                print("⚫",i)
            }
        }
        
    }


}


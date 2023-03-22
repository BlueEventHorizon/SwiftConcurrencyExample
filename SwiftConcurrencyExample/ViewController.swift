//
//  ViewController.swift
//  SwiftConcurrencyExample
//
//  Created by Katsuhiko Terada on 2023/03/22.
//

import UIKit

@MainActor
class ViewController: UIViewController, TestDelegateProtocol, ThreadNameProvider {
    var caller: TestDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        caller = TestDelegate()
        caller.delegate = self
    }

    func callback() {
        printThreadName()
    }
    
    func printThreadName() {
        print("ViewController \(self.threadName)")
    }
}


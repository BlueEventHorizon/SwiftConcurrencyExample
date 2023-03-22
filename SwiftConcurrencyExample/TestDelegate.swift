//
//  TestDelegate.swift
//  SwiftConcurrencyExample
//
//  Created by Katsuhiko Terada on 2023/03/22.
//

import Foundation

protocol TestDelegateProtocol: AnyObject {
    func callback()
}

class TestDelegate: ThreadNameProvider {
    private var timer: Timer?
    
    weak var delegate: TestDelegateProtocol?
    
    let dispatchQueue = DispatchQueue.global()
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            
            self.dispatchQueue.async {
                print("TestDelegate \(self.threadName)")

                self.delegate?.callback()
            }
        })
    }
}

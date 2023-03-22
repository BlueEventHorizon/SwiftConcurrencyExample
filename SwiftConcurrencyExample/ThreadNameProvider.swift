//
//  ThreadNameProvider.swift
//  SwiftConcurrencyExample
//
//  Created by Katsuhiko Terada on 2023/03/22.
//

import Foundation

protocol ThreadNameProvider {
    var threadName: String { get }
}

extension ThreadNameProvider {
    /// スレッド名を取得する
    var threadName: String {
        if Thread.isMainThread {
            return "main"
        }
        if let threadName = Thread.current.name, !threadName.isEmpty {
            return threadName
        }
        if let threadName = String(validatingUTF8: __dispatch_queue_get_label(nil)), !threadName.isEmpty {
            return threadName
        }
        return Thread.current.description
    }
}

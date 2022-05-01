//
//  MulticastDelegate.swift
//  Pegasus
//
//  Created by Tiago on 01/05/2022.
//

import Foundation

final class MulticastDelegate<ProtocolType> {

    // MARK: - DelegateWrapper

    private class DelegateWrapper {

        weak var delegate: AnyObject?

        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    // MARK: - Properties

    private var delegateWrappers: [DelegateWrapper]

    public var delegates: [ProtocolType] {
        delegateWrappers = delegateWrappers.filter { $0.delegate != nil }
        return delegateWrappers.compactMap { $0.delegate } as? [ProtocolType] ?? []
    }

    // MARK: - Initialization

    public init(delegates: [ProtocolType] = []) {
        delegateWrappers = delegates.map {
            DelegateWrapper($0 as AnyObject)
        }
    }
    // MARK: - Delegate Management

    func addDelegate(_ delegate: ProtocolType) {
        let wrapper = DelegateWrapper(delegate as AnyObject)
        delegateWrappers.append(wrapper)
    }

    func removeDelegate(_ delegate: ProtocolType) {
        guard let index = delegateWrappers.firstIndex(where: {
            $0.delegate === (delegate as AnyObject)
        }) else {
            return
        }
        delegateWrappers.remove(at: index)
    }

    func invokeDelegates(_ closure: (ProtocolType) -> Void) {
        delegates.forEach { closure($0) }
    }
}

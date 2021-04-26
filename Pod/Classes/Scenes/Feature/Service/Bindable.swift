//
//  Bindable.swift
//  MVVM-C-Demo
//
//  Created by Douglas Taquary on 22/02/21.
//

import Foundation

public class Bindable<T> {
    typealias Listener = (T) -> Void
    
    // MARK: - Properties
    var listeners: [Listener] = []
    
    //MARK: - Constructors
    init(_ v: T) {
        value = v
    }
    
    // MARK: - Bind
    func bind(_ listener: @escaping Listener) {
        self.listeners.append(listener)
    }
    // MARK: - Trigger
    var value: T {
        didSet { listeners.forEach { $0(value) } }
    }
}

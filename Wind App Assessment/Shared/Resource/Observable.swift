//
//  Observable.swift
//  Wind App Assessment
//
//  Created by MD RUBEL on 3/8/23.
//

import Foundation

protocol ObservableProtocol {
    associatedtype T
    typealias Observer = (T) -> Void
    var value: T { get set }
    
    func bind(_ observer: @escaping Observer)
    func bindAndFire(_ observer: @escaping Observer)
}

final class Observable<T>: ObservableProtocol {
    typealias Observer = (T) -> Void
    
    var observer: Observer?
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ observer: @escaping Observer) {
        self.observer = observer
    }
    
    func bindAndFire(_ observer: @escaping Observer) {
        self.observer = observer
        observer(value)
    }
}

final class Observables {
    
    static func combineLatest<U, V>(_ a: Observable<U>, _ b: Observable<V>, _ callBack: @escaping (U, V) -> Void) {
        a.bind { _ in
            callBack(a.value, b.value)
        }
        
        b.bind { _ in
            callBack(a.value, b.value)
        }
    }
    
    static func combineLatest<U, V, W>(_ a: Observable<U>, _ b: Observable<V>, _ c: Observable<W>, _ callBack: @escaping (U, V, W) -> Void) {
        a.bind { _ in
            callBack(a.value, b.value, c.value)
        }
        
        b.bind { _ in
            callBack(a.value, b.value, c.value)
        }
        
        c.bind { _ in
            callBack(a.value, b.value, c.value)
        }
    }
}

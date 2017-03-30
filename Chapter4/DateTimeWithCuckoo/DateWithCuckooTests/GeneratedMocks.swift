// MARK: - Mocks generated from file: DateWithCuckoo/DateImplementation.swift at 2016-10-20 01:05:27 +0000

//
//  DateImpl.swift
//  UserDefaultsUnitTesting
//
//  Created by Lakshmi Bomma on 10/10/16.
//  Copyright © 2016 riis. All rights reserved.
//

import Cuckoo
@testable import DateWithCuckoo

import Foundation

class MockDateImplementation: DateImplementation, Cuckoo.Mock {
    typealias MocksType = DateImplementation
    typealias Stubbing = __StubbingProxy_DateImplementation
    typealias Verification = __VerificationProxy_DateImplementation
    let manager = Cuckoo.MockManager()
    
    private var observed: DateImplementation?
    
    func spy(on victim: DateImplementation) -> Self {
        observed = victim
        return self
    }
    
    override var choosenDate: Date? {
        get {
            return manager.getter("choosenDate", original: observed.map { o in return { () -> Date? in o.choosenDate } })
        }
        set {
            manager.setter("choosenDate", value: newValue, original: observed != nil ? { self.observed?.choosenDate = $0 } : nil)
        }
    }
    
    override func getPreviousMonth() -> Int {
        return manager.call("getPreviousMonth() -> Int", parameters: (), original: observed.map { o in return { () -> Int in o.getPreviousMonth() } })
    }
    
    override func getCurrentMonth() -> Int {
        return manager.call("getCurrentMonth() -> Int", parameters: (), original: observed.map { o in return { () -> Int in o.getCurrentMonth() } })
    }
    
    override func calculateAge() -> Int {
        return manager.call("calculateAge() -> Int", parameters: (), original: observed.map { o in return { () -> Int in o.calculateAge() } })
    }
    
    override func checkForBirthday() -> Bool {
        return manager.call("checkForBirthday() -> Bool", parameters: (), original: observed.map { o in return { () -> Bool in o.checkForBirthday() } })
    }
    
    struct __StubbingProxy_DateImplementation: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var choosenDate: Cuckoo.ToBeStubbedProperty<Date?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "choosenDate")
        }
        
        func getPreviousMonth() -> Cuckoo.StubFunction<(), Int> {
            return Cuckoo.StubFunction(stub: manager.createStub("getPreviousMonth() -> Int", parameterMatchers: []))
        }
        
        func getCurrentMonth() -> Cuckoo.StubFunction<(), Int> {
            return Cuckoo.StubFunction(stub: manager.createStub("getCurrentMonth() -> Int", parameterMatchers: []))
        }
        
        func calculateAge() -> Cuckoo.StubFunction<(), Int> {
            return Cuckoo.StubFunction(stub: manager.createStub("calculateAge() -> Int", parameterMatchers: []))
        }
        
        func checkForBirthday() -> Cuckoo.StubFunction<(), Bool> {
            return Cuckoo.StubFunction(stub: manager.createStub("checkForBirthday() -> Bool", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_DateImplementation: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var choosenDate: Cuckoo.VerifyProperty<Date?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "choosenDate", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getPreviousMonth() -> Cuckoo.__DoNotUse<Int> {
            return manager.verify("getPreviousMonth() -> Int", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getCurrentMonth() -> Cuckoo.__DoNotUse<Int> {
            return manager.verify("getCurrentMonth() -> Int", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func calculateAge() -> Cuckoo.__DoNotUse<Int> {
            return manager.verify("calculateAge() -> Int", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func checkForBirthday() -> Cuckoo.__DoNotUse<Bool> {
            return manager.verify("checkForBirthday() -> Bool", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class DateImplementationStub: DateImplementation {
    
    override var choosenDate: Date? {
        get {
            return DefaultValueRegistry.defaultValue(for: Optional<Date>.self)
        }
        set {
        }
    }
    
    override func getPreviousMonth() -> Int {
        return DefaultValueRegistry.defaultValue(for: Int.self)
    }
    
    override func getCurrentMonth() -> Int {
        return DefaultValueRegistry.defaultValue(for: Int.self)
    }
    
    override func calculateAge() -> Int {
        return DefaultValueRegistry.defaultValue(for: Int.self)
    }
    
    override func checkForBirthday() -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
}

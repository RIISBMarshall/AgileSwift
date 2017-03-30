// MARK: - Mocks generated from file: Companion/UserDefaultsMock.swift at 2016-10-20 18:09:13 +0000

//
//  UserDefaults.swift
//  Horoscope
//
//  Created by Lakshmi Bomma on 10/3/16.
//  Copyright © 2016 RIIS. All rights reserved.
//

import Cuckoo
@testable import Companion

import Foundation

class MockUserDefaultsMock: UserDefaultsMock, Cuckoo.Mock {
    typealias MocksType = UserDefaultsMock
    typealias Stubbing = __StubbingProxy_UserDefaultsMock
    typealias Verification = __VerificationProxy_UserDefaultsMock
    let manager = Cuckoo.MockManager()
    
    private var observed: UserDefaultsMock?
    
    func spy(on victim: UserDefaultsMock) -> Self {
        observed = victim
        return self
    }
    
    override var standardUserDefaults: UserDefaults? {
        get {
            return manager.getter("standardUserDefaults", original: observed.map { o in return { () -> UserDefaults? in o.standardUserDefaults } })
        }
        set {
            manager.setter("standardUserDefaults", value: newValue, original: observed != nil ? { self.observed?.standardUserDefaults = $0 } : nil)
        }
    }
    
    struct __StubbingProxy_UserDefaultsMock: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var standardUserDefaults: Cuckoo.ToBeStubbedProperty<UserDefaults?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "standardUserDefaults")
        }
    }
    
    struct __VerificationProxy_UserDefaultsMock: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var standardUserDefaults: Cuckoo.VerifyProperty<UserDefaults?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "standardUserDefaults", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
    }
}

class UserDefaultsMockStub: UserDefaultsMock {
    
    override var standardUserDefaults: UserDefaults? {
        get {
            return DefaultValueRegistry.defaultValue(for: Optional<UserDefaults>.self)
        }
        set {
        }
    }
}

// MARK: - Mocks generated from file: Companion/User.swift at 2016-10-20 18:09:13 +0000

//
//  User.swift
//  Companion
//
//  Created by Lakshmi Bomma on 10/5/16.
//  Copyright © 2016 riis. All rights reserved.
//

import Cuckoo
@testable import Companion

import Foundation

class MockUser: User, Cuckoo.Mock {
    typealias MocksType = User
    typealias Stubbing = __StubbingProxy_User
    typealias Verification = __VerificationProxy_User
    let manager = Cuckoo.MockManager()
    
    private var observed: User?
    
    func spy(on victim: User) -> Self {
        observed = victim
        return self
    }
    
    override var username: String? {
        get {
            return manager.getter("username", original: observed.map { o in return { () -> String? in o.username } })
        }
        set {
            manager.setter("username", value: newValue, original: observed != nil ? { self.observed?.username = $0 } : nil)
        }
    }
    
    override var birthDate: String? {
        get {
            return manager.getter("birthDate", original: observed.map { o in return { () -> String? in o.birthDate } })
        }
        set {
            manager.setter("birthDate", value: newValue, original: observed != nil ? { self.observed?.birthDate = $0 } : nil)
        }
    }
    
    override var password: String? {
        get {
            return manager.getter("password", original: observed.map { o in return { () -> String? in o.password } })
        }
        set {
            manager.setter("password", value: newValue, original: observed != nil ? { self.observed?.password = $0 } : nil)
        }
    }
    
    override var todayIsBirthday: Bool {
        get {
            return manager.getter("todayIsBirthday", original: observed.map { o in return { () -> Bool in o.todayIsBirthday } })
        }
        set {
            manager.setter("todayIsBirthday", value: newValue, original: observed != nil ? { self.observed?.todayIsBirthday = $0 } : nil)
        }
    }
    
    override var age: Int? {
        get {
            return manager.getter("age", original: observed.map { o in return { () -> Int? in o.age } })
        }
        set {
            manager.setter("age", value: newValue, original: observed != nil ? { self.observed?.age = $0 } : nil)
        }
    }
    
    override func calculateAge() {
        return manager.call("calculateAge()", parameters: (), original: observed.map { o in return { () in o.calculateAge() } })
    }
    
    override func checkForBirthday() {
        return manager.call("checkForBirthday()", parameters: (), original: observed.map { o in return { () in o.checkForBirthday() } })
    }
    
    struct __StubbingProxy_User: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var username: Cuckoo.ToBeStubbedProperty<String?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "username")
        }
        
        var birthDate: Cuckoo.ToBeStubbedProperty<String?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "birthDate")
        }
        
        var password: Cuckoo.ToBeStubbedProperty<String?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "password")
        }
        
        var todayIsBirthday: Cuckoo.ToBeStubbedProperty<Bool> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "todayIsBirthday")
        }
        
        var age: Cuckoo.ToBeStubbedProperty<Int?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "age")
        }
        
        func calculateAge() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("calculateAge()", parameterMatchers: []))
        }
        
        func checkForBirthday() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("checkForBirthday()", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_User: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var username: Cuckoo.VerifyProperty<String?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "username", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var birthDate: Cuckoo.VerifyProperty<String?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "birthDate", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var password: Cuckoo.VerifyProperty<String?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "password", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var todayIsBirthday: Cuckoo.VerifyProperty<Bool> {
            return Cuckoo.VerifyProperty(manager: manager, name: "todayIsBirthday", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var age: Cuckoo.VerifyProperty<Int?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "age", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func calculateAge() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("calculateAge()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func checkForBirthday() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("checkForBirthday()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class UserStub: User {
    
    override var username: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: Optional<String>.self)
        }
        set {
        }
    }
    
    override var birthDate: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: Optional<String>.self)
        }
        set {
        }
    }
    
    override var password: String? {
        get {
            return DefaultValueRegistry.defaultValue(for: Optional<String>.self)
        }
        set {
        }
    }
    
    override var todayIsBirthday: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: Bool.self)
        }
        set {
        }
    }
    
    override var age: Int? {
        get {
            return DefaultValueRegistry.defaultValue(for: Optional<Int>.self)
        }
        set {
        }
    }
    
    override func calculateAge() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
    override func checkForBirthday() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

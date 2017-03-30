// MARK: - Mocks generated from file: AudioplayerWithCuckoo/AVAudioPlayerHelper.swift at 2016-10-19 19:39:56 +0000

//
//  AVAudioPlayer.swift
//  UserDefaultsUnitTesting
//
//  Created by Lakshmi Bomma on 10/3/16.
//  Copyright © 2016 riis. All rights reserved.
//

import Cuckoo
@testable import AudioplayerWithCuckoo

import AVFoundation
import Foundation

class MockAVAudioPlayerHelper: AVAudioPlayerHelper, Cuckoo.Mock {
    typealias MocksType = AVAudioPlayerHelper
    typealias Stubbing = __StubbingProxy_AVAudioPlayerHelper
    typealias Verification = __VerificationProxy_AVAudioPlayerHelper
    let manager = Cuckoo.MockManager()
    
    private var observed: AVAudioPlayerHelper?
    
    func spy(on victim: AVAudioPlayerHelper) -> Self {
        observed = victim
        return self
    }
    
    override var audioPlayer: AVAudioPlayer? {
        get {
            return manager.getter("audioPlayer", original: observed.map { o in return { () -> AVAudioPlayer? in o.audioPlayer } })
        }
        set {
            manager.setter("audioPlayer", value: newValue, original: observed != nil ? { self.observed?.audioPlayer = $0 } : nil)
        }
    }
    
    override var getVolume: Float {
        get {
            return manager.getter("getVolume", original: observed.map { o in return { () -> Float in o.getVolume } })
        }
    }
    
    override func increaseVolumeOfAudioPlayer() {
        return manager.call("increaseVolumeOfAudioPlayer()", parameters: (), original: observed.map { o in return { () in o.increaseVolumeOfAudioPlayer() } })
    }
    
    struct __StubbingProxy_AVAudioPlayerHelper: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var audioPlayer: Cuckoo.ToBeStubbedProperty<AVAudioPlayer?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "audioPlayer")
        }
        
        var getVolume: Cuckoo.ToBeStubbedReadOnlyProperty<Float> {
            return Cuckoo.ToBeStubbedReadOnlyProperty(manager: manager, name: "getVolume")
        }
        
        func increaseVolumeOfAudioPlayer() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("increaseVolumeOfAudioPlayer()", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_AVAudioPlayerHelper: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var audioPlayer: Cuckoo.VerifyProperty<AVAudioPlayer?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "audioPlayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var getVolume: Cuckoo.VerifyReadOnlyProperty<Float> {
            return Cuckoo.VerifyReadOnlyProperty(manager: manager, name: "getVolume", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func increaseVolumeOfAudioPlayer() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("increaseVolumeOfAudioPlayer()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class AVAudioPlayerHelperStub: AVAudioPlayerHelper {
    
    override var audioPlayer: AVAudioPlayer? {
        get {
            return DefaultValueRegistry.defaultValue(for: Optional<AVAudioPlayer>.self)
        }
        set {
        }
    }
    
    override var getVolume: Float {
        get {
            return DefaultValueRegistry.defaultValue(for: Float.self)
        }
    }
    
    override func increaseVolumeOfAudioPlayer() {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
}

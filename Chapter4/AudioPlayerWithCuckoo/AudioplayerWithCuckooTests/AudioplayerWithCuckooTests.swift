//
//  AudioplayerWithCuckooTests.swift
//  AudioplayerWithCuckooTests
//
//  Created by Lakshmi Bomma on 10/12/16.
//  Copyright © 2016 riis. All rights reserved.
//

import XCTest
import Cuckoo
import AVFoundation


@testable import AudioplayerWithCuckoo

class AudioplayerWithCuckooTests: XCTestCase
{
    let maximumVolume:Float = 1.0
    var tempAudioPlayer:AVAudioPlayer?
    var mockAudioPlayer:MockAudioPlayer?

    
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockAudioPlayer = MockAudioPlayer()
        tempAudioPlayer = mockAudioPlayer?.getAudioPlayer()
    }
    
    class MockAudioPlayer
    {
        let volume:Float = 1.0
        func getAudioPlayer() -> AVAudioPlayer
        {
            let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "Sample",
                                                               ofType: "mp3")!)
            let _: NSError?
            var tempAudioPlayer: AVAudioPlayer?
            
            do
            {
                try
                    tempAudioPlayer = AVAudioPlayer(contentsOf: url)
            } catch
            {
                print("audioPlayer error \(error.localizedDescription)")
            }
            tempAudioPlayer?.volume = volume
            
            return tempAudioPlayer!
            
        }
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mockAudioPlayer = nil
        tempAudioPlayer = nil
    }
    
    
    
    func testIncreaseAudioplayerVolume()
    {
        let mock = MockAVAudioPlayerHelper()
        mockAudioPlayer = MockAudioPlayer()
        
        let tempAudioPlayer = mockAudioPlayer?.getAudioPlayer()

        
        stub(mock) {
            (mock) in
            when(mock.audioPlayer.get).thenReturn(tempAudioPlayer)
        }
        
        stub(mock) {
            (mock) in
            when(mock.increaseVolumeOfAudioPlayer()).thenDoNothing()
        }
        
        stub(mock) {
            (mock) in
            when(mock.getVolume.get).thenReturn(maximumVolume)
        }

       
        XCTAssertEqual(mock.audioPlayer?.volume,maximumVolume)
        XCTAssertEqual(mock.getVolume,maximumVolume)
        XCTAssertEqual(mock.audioPlayer?.volume,tempAudioPlayer?.volume)
        XCTAssertNotNil(verify(mock).audioPlayer)
    }

    
}

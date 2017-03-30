//
//  AVAudioPlayer.swift
//  UserDefaultsUnitTesting
//
//  Created by Lakshmi Bomma on 10/3/16.
//  Copyright © 2016 riis. All rights reserved.
//

import Foundation
import AVFoundation


class AVAudioPlayerHelper
{
    var audioPlayer :AVAudioPlayer?
    
    var getVolume: Float
    {
        return (audioPlayer?.volume)!
    }

    
    func increaseVolumeOfAudioPlayer()
    {
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }

}


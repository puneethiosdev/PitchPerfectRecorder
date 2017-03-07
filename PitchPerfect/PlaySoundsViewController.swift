//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Puneet JR on 07/03/17.
//  Copyright © 2017 Puneet JR. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton:UIButton!
    @IBOutlet weak var chipMunkButton:UIButton!
    @IBOutlet weak var rabbitButton:UIButton!
    @IBOutlet weak var vaderButton:UIButton!
    @IBOutlet weak var echoButton:UIButton!
    @IBOutlet weak var reverbButton:UIButton!
    @IBOutlet weak var stopButton:UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType : Int { case slow = 0, fast, chipmunk, vader, echo, reverb  }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(0.5, pitch: 0, echo: false, reverb: false)
        case .fast:
            playSound(1.5, pitch: 0, echo: false, reverb: false)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        
            configureUI(.playing)
        }
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

}

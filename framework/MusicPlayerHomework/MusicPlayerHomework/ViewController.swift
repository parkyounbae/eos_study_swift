//
//  ViewController.swift
//  MusicPlayerHomework
//
//  Created by 박윤배 on 2021/04/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    // MARK: Property
    var player: AVAudioPlayer!
    var timer: Timer!
    
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    // MARK: Initial Function
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else{
            print("There is no sound file.")
            return
        }
        
        do{
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        }catch let error as NSError{
            print("Failed to intialize Player")
            print(error.code)
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval){
        let min: Int = Int(time/60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let miliSecond: Int = Int(time.truncatingRemainder(dividingBy: 1)*100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", min,second,miliSecond)
        self.timeLable.text = timeText
    }
    
    func makeAndFireTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {[unowned self] (timer: Timer) in
            if self.progressSlider.isTracking { return }
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func invalidateTimer(){
        self.timer.invalidate()
        self.timer = nil
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializePlayer()
    }

    //MARK:Action Function
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected{
            self.player.play()
        }else{
            self.player.pause()
        }
        
        if sender.isSelected{
            self.timer.fire()
        }else{
            self.timer.invalidate()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking {return}
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else{
            print("player decord error")
            return
        }
        
        let message: String
        message = "audio player error \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (action: UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
    
}


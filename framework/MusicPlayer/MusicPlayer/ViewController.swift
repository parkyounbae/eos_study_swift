//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 박윤배 on 2021/04/12.
//

import UIKit
import AVFoundation
//미디어를 담당하는 프레임 워크를 import해준다.

class ViewController: UIViewController, AVAudioPlayerDelegate {
//AVAudioPlayer class를 상속
    //AVAudioPlayer Property
    var player: AVAudioPlayer!
    var timer: Timer!
    
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLable: UILabel!
    @IBOutlet var progressSlider: UISlider!
    //유저 인터페이스 요소와 연결한 프로퍼티들
    //전부 인스턴스 프로퍼티
    
    //Method
    //Custom method
    //Player reset method
    func initializePlayer(){
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("Can not find music file.")
            return
        }
        //에셋에 sound라는 파일이 있는지 왁인
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
            //우리가 AVAudioPlayer을 delegate해주었으니 위임자를 명시해 주어야 한다.
            //이제부터 player의 뒷바라지는 ViewController가 할게!!
            //player에 이벤트가 발생하면 뷰컬트롤러가 프로토콜에 따라 응답을 준다.
        } catch let error as NSError {
            print("fail to reset player")
            print("code : \(error.code), message : \(error.localizedDescription)")
        }
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
        //진행 바에대한 정보들을 초기화시켜줌
    }
    
    //레이블을 매 초마다 업데이트 해주는 메서드
    func updateTimeLableText(time: TimeInterval){
        let minute: Int = Int(time/60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        //truncatingRemainder : 나머지 구하기
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1)*100)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute,second,milisecond)
        
        self.timeLable.text = timeText
    }
    
    //타이머를 만들고 수행하는 메서드
    func makeAndFireTimer(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {[unowned self] (timer: Timer) in
            if self.progressSlider.isTracking { return }
            
            self.updateTimeLableText(time: self.player.currentTime)
            //초단위로 넘어가는 듯? 라벨의 시간 바꿔주고
            self.progressSlider.value = Float(self.player.currentTime)
            //슬라이더 바의 시간 바꿔주고
        })
        self.timer.fire()
    }
    
    //타이머를 해제
    func invalidateTimer(){
        self.timer.invalidate()
        self.timer = nil
    }
    /*
    func addViewsWithCode() {
        self.addPlayPauseButton()
        self.addTimeLabel()
        self.addProgressSlider()
    }
    
    func addPlayPauseButton() {
        
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setImage(UIImage(named: "button_play"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "button_pause"), for: UIControl.State.selected)
        
        button.addTarget(self, action: #selector(self.touchUpPlayPauseButton(_:)), for: UIControl.Event.touchUpInside)
        
        let centerX: NSLayoutConstraint
        centerX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let centerY: NSLayoutConstraint
        centerY = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 0.8, constant: 0)
        
        let width: NSLayoutConstraint
        width = button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5)
        
        let ratio: NSLayoutConstraint
        ratio = button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1)
        
        centerX.isActive = true
        centerY.isActive = true
        width.isActive = true
        ratio.isActive = true
        
        self.playPauseButton = button
    }
    
    func addTimeLabel() {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        let centerX: NSLayoutConstraint
        centerX = label.centerXAnchor.constraint(equalTo: self.playPauseButton.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = label.topAnchor.constraint(equalTo: self.playPauseButton.bottomAnchor, constant: 8)
        
        centerX.isActive = true
        top.isActive = true
        
        self.timeLable = lable
        self.updateTimeLabelText(time: 0)
    }
    
    func addProgressSlider() {
        let slider: UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(slider)
        
        slider.minimumTrackTintColor = UIColor.red
        
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        let safeAreaGuide: UILayoutGuide = self.view.safeAreaLayoutGuide
        
        let centerX: NSLayoutConstraint
        centerX = slider.centerXAnchor.constraint(equalTo: self.timeLabel.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = slider.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 8)
        
        let leading: NSLayoutConstraint
        leading = slider.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16)
        
        let trailing: NSLayoutConstraint
        trailing = slider.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16)
        
        centerX.isActive = true
        top.isActive = true
        leading.isActive = true
        trailing.isActive = true
        
        self.progressSlider = slider
    }
    코드를 통해 오토 레이아웃
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.addViewsWithCode()
        self.initializePlayer()
    }

    //실행할 메서드 구현, 기본 func앞에 IBAction 키워드를 넣는다.
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton){
        //매개변수는 어느 버튼이 클릭되었는지.
        //메인스토리보드에서 버튼과 연결해준다
        sender.isSelected = !sender.isSelected
        //내가 직접 바꿔주어야 한다. 초기는 false로 설정되어있음
        
        if sender.isSelected{
            self.player?.play()
        }else{
            self.player?.pause()
        }
        
        if sender.isSelected{
            self.makeAndFireTimer()
        }else{
            self.invalidateTimer()
        }
        
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        //마찬가지로 슬라이더와 연결해준다.
        self.updateTimeLableText(time: TimeInterval(sender.value))
        if sender.isTracking {return}
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    //AVAudioPlayerDelegate
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
        self.updateTimeLableText(time: 0)
        self.invalidateTimer()
    }
}


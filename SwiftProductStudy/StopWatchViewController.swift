//
//  StopWatchViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/4.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController, UITableViewDelegate {

    
    fileprivate let mainStopWatch: StopWatch = StopWatch()
    fileprivate let lapStopWatch: StopWatch = StopWatch()
    fileprivate var isPlay: Bool = false
    fileprivate var laps: [String] = []
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.portrait
    }

    var timerLabel: UILabel!
    var lapTimerLabel: UILabel!
    var playPauseButton: UIButton!
    var lapResetButton: UIButton!
    var lapTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func initCircleButton(_ button: UIButton) {
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = UIColor.white
    }
    
    //MARK: Hide status bar
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: play, pause, lap, and reset
    
    func playPauseTimer(_ sender: AnyObject) {
        lapResetButton.isEnabled = true;
        changeButton(lapResetButton, title: "Lap", titleColor: UIColor.black)
        
        if !isPlay {
            mainStopWatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: Selector.updateMainTimer, userInfo: nil, repeats: true)
            lapStopWatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopWatch.timer, forMode: .commonModes)
            RunLoop.current.add(lapStopWatch.timer, forMode: .commonModes)
            
            isPlay = true;
            changeButton(playPauseButton, title: "stop", titleColor: UIColor.red)
        }else{
            mainStopWatch.timer.invalidate()
            lapStopWatch.timer.invalidate()
            isPlay = false
            changeButton(playPauseButton, title: "start", titleColor: UIColor.green)
            changeButton(lapResetButton, title: "Reset", titleColor: UIColor.black)
        }
    }
    
    func lapResetTimer(_ sender: AnyObject) -> Void {
        if !isPlay {
            
        }
    }
    
    fileprivate func changeButton(_ button: UIButton, title: String, titleColor: UIColor) {
        button.setTitle(title, for: UIControlState())
        button.setTitleColor(titleColor, for: UIControlState())
    }
    
    fileprivate func resetMainTimer() {
        resetTimer(mainStopWatch, label: timerLabel)
        laps.removeAll()
        lapTableView.reloadData()
    }
    
    fileprivate func resetLapTimer() {
        resetTimer(lapStopWatch, label: lapTimerLabel)
    }
    
    fileprivate func resetTimer(_ stopWatch: StopWatch, label: UILabel) {
        stopWatch.timer.invalidate()
        stopWatch.counter = 0.0
        label.text = "00:00:00"
    }
    
    
    // MARK: update two timer labels seperately
    func updateMainTimer() {
        updateTimer(mainStopWatch, label: timerLabel)
    }
    
    func updateLapTimer() {
        updateTimer(lapStopWatch, label: lapTimerLabel)
    }
    
    func updateTimer(_ stopWatch: StopWatch, label: UILabel) -> Void {
        stopWatch.counter = stopWatch.counter + 0.035
        
        var minutes: String = "\((Int)(stopWatch.counter / 60))"
        if (Int)(stopWatch.counter / 60) < 10 {
            minutes = "0\((Int)(stopWatch.counter / 60))"
        }
        
        var seconds: String = String(format: "%.2f", stopWatch.counter.truncatingRemainder(dividingBy: 60))
        
        if stopWatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        label.text = minutes + ":" + seconds
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}


extension StopWatchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "lapCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap \(laps.count - (indexPath as NSIndexPath).row)"
        }
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = laps[laps.count - (indexPath as NSIndexPath).row - 1]
        }
        
        return cell
    }
}

fileprivate extension Selector {
    static let updateMainTimer = #selector(StopWatchViewController.updateMainTimer)
    static let updateLapTimer = #selector(StopWatchViewController.updateLapTimer)

}



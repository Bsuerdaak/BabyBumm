//
//  PlaySoundViewController.swift
//  BabyBumm
//
//  Created by Burak Altunoluk on 02/01/2021.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    override var prefersStatusBarHidden: Bool {
        return true}
   
    @IBAction func Button(_ sender: UIButton) {
        timer1.invalidate()
        rattleStatue = 0
        imageView.image = #imageLiteral(resourceName: "11")
        player?.stop()
        performSegue(withIdentifier: "toHomePlay", sender: nil)
        
    }
    
var player: AVAudioPlayer!
var whichOne = 0
var timer1 = Timer()
var rattleStatue = 0
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        
        let dokundu = UITapGestureRecognizer(target: self, action: #selector (gorev))
        imageView.addGestureRecognizer(dokundu)
       
           
        
        
       
       
    }
    @objc func gorev () {
        
        if rattleStatue == 0 {
            timer1 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
            rattleStatue = 1
            let url = Bundle.main.url(forResource: "rattle", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            
        }
        else {
            timer1.invalidate()
            rattleStatue = 0
            imageView.image = #imageLiteral(resourceName: "11")
            player.stop()
        }
       
        
        }
    @objc func timerFunction() {
    
        whichOne += 1
        
        if whichOne == 1 {imageView.image = #imageLiteral(resourceName: "12a")}
        if whichOne == 2 {imageView.image = #imageLiteral(resourceName: "11a")}
        if whichOne == 3 {imageView.image = #imageLiteral(resourceName: "13a")}
        if whichOne == 4 {imageView.image = #imageLiteral(resourceName: "11a")}
        
        if whichOne == 4 {
            whichOne = 0
            
        }
        
       
        
    
    }
    
   
}

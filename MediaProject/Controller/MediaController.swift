//
//  MediaController.swift
//  MediaProject
//
//  Created by Morales, Brittney on 10/18/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import AVFoundation

class MediaController: UIViewController {
    private var soundPlayer : AVAudioPlayer?
    private var imageCounter : Int = 0
    //private lazy var color : ColorTools
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var soundBtn: UIButton!
    @IBOutlet weak var soundSlider: UISlider!
    
    @IBAction func changePicture() -> Void
    {
        switchImage()
    }
    
    
    private func switchImage() -> Void
    {
        if (imageCounter > 2)
        {
            imageCounter =  0
        }
        if (imageCounter == 0)
        {
            Image.image = UIImage(named: "doberman")
        }
        else if (imageCounter == 1)
        {
            Image.image = UIImage(named: "logo")
        }
        else
        {
            Image.image = UIImage(named: "meme bug")
        }
        imageCounter += 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAudioFile()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func musicPlay() -> Void
    {
        playMusicFile()
    }
    
    private func playMusicFile() -> Void
    {
        if let isPlaying = soundPlayer?.isPlaying //better code and prevents crash
        {
            if (isPlaying)
            {
                soundPlayer?.pause()
            }
            else
            {
                soundPlayer?.play()
            }
        }
//        if (soundPlayer?.isPlaying)! //not the best code, also not the safest, could crash program
//        {
//            soundPlayer?.pause()
//        }
//        else
//        {
//            soundPlayer?.play()
//        }
    }
    
    private func loadAudioFile() -> Void
    {
        if let soundURL = NSDataAsset(name: "Glorious")
        {
            do
            {
                try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try! AVAudioSession.sharedInstance().setActive(true)
                
                try soundPlayer = AVAudioPlayer(data: soundURL.data, fileTypeHint: AVFileType.mp3.rawValue)
                soundSlider.maximumValue = Float ((soundPlayer?.duration)!)
                Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: (#selector(self.updateSlider)), userInfo:nil, repeats: true)
            }
            catch
            {
                print("Audio File Load Error")
            }
        }
    }
    
    @objc private func updateSlider() -> Void
    {
        soundSlider.value = Float ((soundPlayer?.currentTime)!)
    }
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

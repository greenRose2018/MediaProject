//
//  SecondViewController.swift
//  MediaProject
//
//  Created by Morales, Brittney on 10/18/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
    private var counterImage = 0
    
    @IBOutlet weak var imageScreen: UIImageView!
    @IBOutlet weak var changeImage: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func changePicture() -> Void
    {
        switchImage()
    }
    private func switchImage() -> Void
    {
        if (counterImage > 2)
        {
            counterImage = 0
        }
        if (counterImage == 0)
        {
            imageScreen.image = UIImage(named: "logo")
        }
        else if (counterImage == 1)
        {
            imageScreen.image = UIImage(named: "doberman")
        }
        else
        {
            imageScreen.image = UIImage(named: "meme bug")
        }
        counterImage += 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

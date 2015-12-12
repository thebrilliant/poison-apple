//
//  NavViewController.swift
//  FinalProject
//
//  Created by Susan Wolfgram on 12/10/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit
import AVFoundation

struct images {
    var snowWhite : [UIImage]
    var redRidingHood : [UIImage]
}

class NavViewController: UINavigationController {
    var appTheme : UIColor = UIColor.whiteColor()
    var appThemeName = 0
    var playerName : String = String()
    var backgroundAudio = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kwps", ofType: "mp3")!))
    var imagesSource = images(snowWhite : [UIImage(named: "snow-white-profile")!, UIImage(named: "evil-queen-profile")!], redRidingHood : [UIImage(named: "snow-white-profile")!, UIImage(named: "evil-queen-profile")!])
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

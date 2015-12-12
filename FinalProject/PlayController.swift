//
//  PlayController.swift
//  FinalProject
//
//  Created by iGuest on 12/3/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit
import AVFoundation

class PlayController: UIViewController {
    
    @IBOutlet weak var progressDisplay: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyText: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    
    /*//var sourcePath = NSBundle.mainBundle().pathForResource("kpws", ofType: "mp3")!
    var sourcePath = NSBundle.mainBundle().pathForResource("kwps", ofType: "mp3")
    var filePath : NSURL = NSURL(string: "music/kwps.mp3", relativeToURL: NSURL(string: NSBundle.mainBundle().pathForResource("kwps", ofType: "mp3")!))!
    
    var audio = try? AVAudioPlayer(contentsOfURL: NSURL(string: "music/kwps.mp3", relativeToURL: nil)!, fileTypeHint: "mp3")
    
    //var backgroundAudio = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kpws", ofType: "mp3")!))
    */
    
    var appTheme : UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*print("source path: \(sourcePath)")
        print("file path: \(filePath)")
        audio!.play()*/
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        setBackground()
    }
    
    func setBackground() {
        //let navController : NavViewController = self.view.window?.rootViewController as! NavViewController
        let navCont = self.navigationController as! NavViewController
        self.appTheme = navCont.appTheme
        self.view.backgroundColor = self.appTheme
        print("\(navCont.appTheme) derry derry 1234")
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

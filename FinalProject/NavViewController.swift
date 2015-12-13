//
//  NavViewController.swift
//  FinalProject
//
//  Created by Susan Wolfgram on 12/10/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

struct images {
    var snowWhite : [UIImage]
    var redRidingHood : [UIImage]
}

class NavViewController: UINavigationController {
    var appTheme : UIColor = UIColor.whiteColor()
    var appThemeName = 0
    var playerName : String = String()
    var items = [NSDictionary]()
    var myRootRef = Firebase(url:"https://swift-sw.firebaseio.com/")
    var backgroundAudio = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("kwps", ofType: "mp3")!))
    var imagesSource = images(snowWhite : [UIImage(named: "snow-white-profile")!, UIImage(named: "evil-queen-profile")!], redRidingHood : [UIImage(named: "snow-white-profile")!, UIImage(named: "evil-queen-profile")!])
    
    override func viewDidLoad() {
        super.viewDidLoad()
            myRootRef.observeEventType(.Value, withBlock: { snapshot in
                var tempItems = [NSDictionary]()
                    for item in snapshot.children {
                        let child = item as! FDataSnapshot
                        let dict = child.value as! NSDictionary
        
                        tempItems.append(dict)
                    }
        
                    self.items = tempItems
                    var foo = [String:AnyObject]()
                    foo = self.items[0]["Page1"]! as! [String : AnyObject]
                    print(foo["Text"]!)
            })
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

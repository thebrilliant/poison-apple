//
//  PlayController.swift
//  FinalProject
//
//  Created by iGuest on 12/3/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit
import Firebase

class PlayController: UIViewController {
    
    @IBOutlet weak var progressDisplay: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyText: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    
    @IBOutlet weak var mainMenu: UIButton!
    //var sourcePath = NSBundle.mainBundle().pathForResource("kpws", ofType: "mp3")!
    //var sourcePath = NSBundle.mainBundle().pathForResource("kwps", ofType: "mp3")
    //var filePath : NSURL = NSURL(string: "music/kwps.mp3", relativeToURL: NSURL(string: NSBundle.mainBundle().pathForResource("kwps", ofType: "mp3")!))!
    //var audio = try? AVAudioPlayer(contentsOfURL: NSURL(string: "music/kwps.mp3", relativeToURL: nil)!, fileTypeHint: "mp3")
    
    var appTheme : UIColor!
    var randNum = Int(arc4random_uniform(2))
    var deathChoice = false
    var myCounter = 0
    var timer:NSTimer?
    var myText = [Character]()
    
    
    @IBAction func saveProg(sender: UIButton) {
        let myRootRef = Firebase(url:"https://swift-sw.firebaseio.com/")
        myRootRef.childByAppendingPath("Aa Save").childByAppendingPath("Index").setValue(1)
    }
    func fireTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "typeLetter", userInfo: nil, repeats: true)
    }
    func typeLetter(){
        if myCounter < myText.count {
            storyText.text = storyText.text! + String(myText[myCounter])
            let randomInterval = Double((arc4random_uniform(8)+1))/70
            timer?.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(randomInterval, target: self, selector: "typeLetter", userInfo: nil, repeats: false)
        } else {
            timer?.invalidate()
        }
        myCounter++
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*print("source path: \(sourcePath)")
        print("file path: \(filePath)")*/
        
        mainMenu.hidden = true
        
        // Do any additional setup after loading the view.
        let navCont = self.navigationController as! NavViewController
        self.navigationItem.title = "Page\(navCont.pageNum)"
        navCont.backgroundAudio!.play()
        
        var foo = [String:AnyObject]()
        foo = navCont.items[1]["Page\(navCont.pageNum)"]! as! [String : AnyObject]
        var text = foo["Text"] as? String
        fireTimer()
        text = text.self!.stringByReplacingOccurrencesOfString("[name]", withString:navCont.playerName)
        
        myText = Array(text!.characters)
        
        
        if(foo["Choice1"] as? String == "Main Menu") {
            mainMenu.hidden = false
            option1.hidden = true
            option2.hidden = true
         mainMenu.setTitle(foo["Choice1"] as? String, forState: .Normal)
        } else {
            print(randNum)
            if(randNum == 0) {
                option1.setTitle(foo["Choice1"] as? String, forState: .Normal)
                option2.setTitle(foo["Choice2"] as? String, forState: .Normal)
            } else {
                deathChoice = true
                option2.setTitle(foo["Choice1"] as? String, forState: .Normal)
                option1.setTitle(foo["Choice2"] as? String, forState: .Normal)
            }
        }
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "next" {
            let navCont = self.navigationController as! NavViewController
            if(deathChoice){
            navCont.pageNum++
            } else {
            navCont.pageNum++
            navCont.pageNum++
            }
        } else if segue.identifier == "back" {
            let navCont = self.navigationController as! NavViewController
            if(deathChoice){
                navCont.pageNum++
                navCont.pageNum++
            } else {
                navCont.pageNum++
            }
        } else if segue.identifier == "main" {
            let navCont = self.navigationController as! NavViewController
            navCont.pageNum = 1
        }
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

//
//  MenuController.swift
//  FinalProject
//
//  Created by iGuest on 12/3/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var characterPicker: UIPickerView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var savedName: UILabel!
    
    var currentStory : String?
    var pickerDataSource = ["White", "Red", "Green", "Blue"]
    var imagesSource = [UIImage]()
    var appTheme : UIColor!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        self.characterPicker.dataSource = self
        self.characterPicker.delegate = self
        savedName.hidden = true
        
        let navCont = self.navigationController as! NavViewController
        navCont.backgroundAudio!.stop()
        if(currentStory == "Snow White") {
            imagesSource = navCont.imagesSource.snowWhite
            if(navCont.characterIndex == nil) {
                navCont.characterIndex = 2
            }
        } else {
            imagesSource = navCont.imagesSource.redRidingHood
            if(navCont.characterIndex == nil) {
                navCont.characterIndex = 4
            }
        }
        storyTitle.text = "Choose your character!"

    }
    
    @IBAction func toSettings(sender: AnyObject) {
        performSegueWithIdentifier("Settings", sender: self)
    }
    
    @IBAction func moveToStart(sender: AnyObject) {
        let navCont = self.navigationController as! NavViewController
//        if navCont.items[0]["Index"] as? Int != 0 {
//            playerName.text! = (navCont.items[0]["Name"] as? String)!
//        }
        if NSUserDefaults.standardUserDefaults().objectForKey("name") as? String == nil || NSUserDefaults.standardUserDefaults().objectForKey("name") as? String == ""  {
            navCont.playerName = self.playerName.text!
        } else {
            navCont.playerName = (NSUserDefaults.standardUserDefaults().objectForKey("name") as? String)!
        }
        performSegueWithIdentifier("toStart", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        
        setBackground()
        let navCont = self.navigationController as! NavViewController
                print("menu: \(navCont.pageNum), name : \(navCont.playerName), charIndex: \(navCont.characterIndex)")
                print("menu: \(NSUserDefaults.standardUserDefaults().objectForKey("num") as? Int), name : \(NSUserDefaults.standardUserDefaults().objectForKey("name") as? String), charIndex: \(NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int)")
        
        if NSUserDefaults.standardUserDefaults().objectForKey("name") as? String != nil {
            if NSUserDefaults.standardUserDefaults().objectForKey("name") as? String != ""  {
                print(NSUserDefaults.standardUserDefaults().objectForKey("name") as? String)
                playerName.hidden = true
                savedName.hidden = false
                characterPicker.hidden = true
                savedName.text = NSUserDefaults.standardUserDefaults().objectForKey("name") as? String
                storyTitle.text = "You have a saved story!"
//                if (NSUserDefaults.standardUserDefaults().objectForKey("num") as? Int != 1 || NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int == nil) && navCont.characterIndex == 2 {
               if navCont.pageNum == 1 && navCont.playerName != "" && navCont.characterIndex == 2 && NSUserDefaults.standardUserDefaults().objectForKey("num") as? Int == 1 && NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int == nil  {
                    if(currentStory == "Snow White") {
                        navCont.characterIndex = 1
                    }
                }
//                    
//                if (NSUserDefaults.standardUserDefaults().objectForKey("num") as? Int != 1 || NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int == nil)  && navCont.characterIndex == 4 {
               if navCont.pageNum == 1 && navCont.playerName != "" && navCont.characterIndex == 4 && NSUserDefaults.standardUserDefaults().objectForKey("num") as? Int == 1 && NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int == nil {
                print(currentStory)
                
                if(currentStory == "Red Riding Hood") {
                        navCont.characterIndex = 3
                    }
                }
                
            }
           
        }
    }
    
    func setBackground() {
        //let navController : NavViewController = self.view.window?.rootViewController as! NavViewController
        let navCont = self.navigationController as! NavViewController
        self.appTheme = navCont.appTheme
        self.view.backgroundColor = self.appTheme
        print("\(navCont.appTheme) derry derry 1234")
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imagesSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let navCont = self.navigationController as! NavViewController
        
        if(currentStory == "Snow White"){
            if(row == 0) {
               if NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int == nil {
                    print("menu test1")
                    navCont.characterIndex = 2
               } else {
                print("menu test2")
                    navCont.characterIndex = (NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int)!
               }
            } else {
                if NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int == nil {
                    print("menu test3")
                    navCont.characterIndex = 1
                } else {
                    print("menu test4")
                    navCont.characterIndex = (NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int)!
                }
            }
        } else {
            if(row == 0) {
                if NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int == nil {
                    navCont.characterIndex = 4
                } else {
                    navCont.characterIndex = (NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int)!
                }
            } else {
                if NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int == nil {
                    navCont.characterIndex = 3
                } else {
                    navCont.characterIndex = (NSUserDefaults.standardUserDefaults().objectForKey("charIndex") as? Int)!
                }
            }
        }
//        if(row == 0) {
//            self.view.backgroundColor = UIColor.init(red: 200, green: 0, blue: 150, alpha: 1)
//        } else if(row == 1) {
//            self.view.backgroundColor = UIColor.redColor();
//        } else if(row == 2) {
//            self.view.backgroundColor =  UIColor.greenColor();
//        } else {
//            self.view.backgroundColor = UIColor.blueColor();
//        }
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 120
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        
        var myView = UIView(frame: CGRectMake(0, 0, pickerView.bounds.width - 30, 120))
        
        var myImageView = UIImageView(frame: CGRectMake(0, 0, 290, 120))
        
        var rowString = String()
        switch row {
        case 0:
            //rowString = “Washington”
            myImageView.image = imagesSource[row]
        case 1:
            //rowString = “Beijing”
            myImageView.image = imagesSource[row]
        case 2:
            myImageView.image = imagesSource[row]
        case 3:
            myImageView.image = imagesSource[row]
        default:
            rowString = "Error: too many rows"
            myImageView.image = nil
        }
        //let myLabel = UILabel(frame: CGRectMake(60, 0, pickerView.bounds.width - 90, 60 ))
        //myLabel.font = UIFont(name:some font, size: 18)
        //myLabel.text = rowString
        
        //myView.addSubview(myLabel)
        myView.addSubview(myImageView)
        
        return myView
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

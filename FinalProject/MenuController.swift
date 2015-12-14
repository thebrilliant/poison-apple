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
    
    var currentStory : String?
    var pickerDataSource = ["White", "Red", "Green", "Blue"]
    var imagesSource = [UIImage]()
    var appTheme : UIColor!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        self.characterPicker.dataSource = self
        self.characterPicker.delegate = self
        
        let navCont = self.navigationController as! NavViewController
        navCont.backgroundAudio!.stop()
        if(currentStory == "Snow White") {
            imagesSource = navCont.imagesSource.snowWhite
            navCont.characterIndex = 2
        } else {
            imagesSource = navCont.imagesSource.redRidingHood
            navCont.characterIndex = 4
        }
        
    }
    
    @IBAction func toSettings(sender: AnyObject) {
        performSegueWithIdentifier("Settings", sender: self)
    }
    
    @IBAction func moveToStart(sender: AnyObject) {
        let navCont = self.navigationController as! NavViewController
        navCont.playerName = playerName.text!
        
        performSegueWithIdentifier("toStart", sender: self)
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
                navCont.characterIndex = 2
            } else {
                navCont.characterIndex = 1
            }
        } else {
            if(row == 0) {
                navCont.characterIndex = 4
            } else {
                navCont.characterIndex = 3
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

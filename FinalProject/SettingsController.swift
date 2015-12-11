//
//  SettingsController.swift
//  FinalProject
//
//  Created by iGuest on 12/3/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

class SettingsController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var colorThemePicker: UIPickerView!
    
    var appTheme : UIColor!
    
    var pickerDataSource = ["Basic", "Blood"/*, "Decay", "Midnight"*/]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorThemePicker.dataSource = self
        self.colorThemePicker.delegate = self
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
        let navCont = self.navigationController as! NavViewController
        self.appTheme = navCont.appTheme
        self.view.backgroundColor = self.appTheme
        print("\(navCont.appTheme) derry derry 1234")
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let navController : NavViewController = self.view.window?.rootViewController as! NavViewController
        if(row == 0) {
            self.view.backgroundColor = UIColor.whiteColor()
            appTheme = UIColor.whiteColor()
        } else if(row == 1) {
            self.view.backgroundColor = UIColor.init(hue: 11, saturation: 94, brightness: 63, alpha: 0.8)
            appTheme = UIColor.init(hue: 11, saturation: 94, brightness: 63, alpha: 0.8)
        } else if(row == 2) {
            //self.view.backgroundColor = UIColor.greenColor()
            self.view.backgroundColor =  UIColor.init(red: 98, green: 194, blue: 25, alpha: 0.8)
            appTheme = UIColor.init(red: 98, green: 194, blue: 25, alpha: 0.8)
            //appTheme = UIColor.init(hue: 94, saturation: 87, brightness: 76, alpha: 1)
        } else {
            self.view.backgroundColor = UIColor.init(hue: 242, saturation: 96, brightness: 39, alpha: 0.8)
            appTheme = UIColor.init(hue: 242, saturation: 96, brightness: 39, alpha: 0.8)
        }
        navController.appTheme = self.appTheme
        print(navController.appTheme)
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

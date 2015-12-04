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
    
    var pickerDataSource = ["White", "Red", "Green", "Blue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.characterPicker.dataSource = self
        self.characterPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if(row == 0) {
            self.view.backgroundColor = UIColor.whiteColor();
        } else if(row == 1) {
            self.view.backgroundColor = UIColor.redColor();
        } else if(row == 2) {
            self.view.backgroundColor =  UIColor.greenColor();
        } else {
            self.view.backgroundColor = UIColor.blueColor();
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

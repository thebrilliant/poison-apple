//
//  StartController.swift
//  FinalProject
//
//  Created by iGuest on 12/3/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

class StartController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startImage: UIImageView!
    
    var appTheme : UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navCont = self.navigationController as! NavViewController
        print(navCont.playerName)
        startImage.image = UIImage(named: "apple-cube")
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
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
    
    @IBAction func startPressed(sender: AnyObject) {
        performSegueWithIdentifier("toPlay", sender: self)
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

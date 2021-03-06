//
//  StartScreenController.swift
//  FinalProject
//
//  Created by iGuest on 12/3/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit
import Firebase

class StartScreenController: UITableViewController {
    
    let storyImages = [UIImage(named: "snow-white"), UIImage(named: "red-riding-hood"), UIImage(named: "coming-soon"), UIImage(named: "hansel-and-gretel"), UIImage(named: "Rapunzel"), UIImage(named: "sleeping-beauty"), UIImage(named: "alice"), UIImage(named: "ariel"), UIImage(named: "cinderella"), UIImage(named: "peter-pan"), UIImage(named: "jack-giant")]
    let storyNames = ["Snow White","Red Riding Hood","coming-soon","Hansel and Gretel","Rapunzel","Sleeping Beauty","Alice","Ariel","Cinderella", "Peter-pan","jack-giant"]
    var appTheme : UIColor!
    
    var rowClicked: Int?

    @IBAction func settingsButton(sender: AnyObject) {
        performSegueWithIdentifier("toSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let navCont = self.navigationController as! NavViewController
        navCont.backgroundAudio!.stop()
        self.navigationItem.hidesBackButton = true
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        setBackground()
        let navCont = self.navigationController as! NavViewController
    }
    
    func setBackground() {
        //let navController : NavViewController = self.view.window?.rootViewController as! NavViewController
        let navCont = self.navigationController as! NavViewController
        self.appTheme = navCont.appTheme
        self.view.backgroundColor = self.appTheme
        print("\(navCont.appTheme) derry derry 1234")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storyImages.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StoryNames", forIndexPath: indexPath) as! StoryCell
        cell.storyImage.image = self.storyImages[indexPath.row]
        cell.storyTitle = self.storyNames[indexPath.row]

        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let navCont = self.navigationController as! NavViewController
         switch indexPath.row {
            case 0,1:
            if NSUserDefaults.standardUserDefaults().objectForKey("num") as? Int != 1 {
                 if navCont.characterIndex != nil {
                    if (navCont.characterIndex  == 1 || navCont.characterIndex  == 2) && indexPath.row == 0 {
                        rowClicked = indexPath.row
                        performSegueWithIdentifier("toMenu", sender: self)
                    }
                    if (navCont.characterIndex  == 3 || navCont.characterIndex  == 4) && indexPath.row == 1 {
                        rowClicked = indexPath.row
                        performSegueWithIdentifier("toMenu", sender: self)
                    }
                } else {
                    rowClicked = indexPath.row
                    performSegueWithIdentifier("toMenu", sender: self)
                }
            }else {
                rowClicked = indexPath.row
                performSegueWithIdentifier("toMenu", sender: self)
            }
            default:
                print("coming soon")
            }
//        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toMenu" {
            let cell = sender as! StartScreenController
            let menuController = segue.destinationViewController as! MenuController
            menuController.currentStory = storyNames[rowClicked!]
            menuController.navigationItem.title = storyNames[rowClicked!]
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

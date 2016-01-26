//
//  userSettingViewController.swift
//  SmartFarm
//
//  Created by Yuan Yinhuan on 15/8/29.
//  Copyright (c) 2015年 Jun Dang. All rights reserved.
//

import UIKit

class userSettingViewController: UIViewController {

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
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        
        
    }

   
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        
       // NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
       // NSUserDefaults.standardUserDefaults().synchronize()
        self.performSegueWithIdentifier("logout", sender: self)
        print("like you")
        
    }
  
    
    
    
    

}
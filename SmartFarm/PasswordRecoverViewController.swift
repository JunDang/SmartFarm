//
//  PasswordRecoverViewController.swift
//  SmartFarm
//
//  Created by Yuan Yinhuan on 15/8/30.
//  Copyright (c) 2015年 Jun Dang. All rights reserved.
//

import UIKit

class PasswordRecoverViewController: UIViewController {
    
    @IBOutlet weak var userPhone: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func recoverButtonPressed(sender: AnyObject) {
         //println("hello")
        let phone = userPhone.text
       
        let userPhoneStored = NSUserDefaults.standardUserDefaults().stringForKey("phoneNumber")!
       
        if (userPhoneStored == phone) {
            let message = "我们会尽快联系您"
            displayMessage(message)
            
        } else {
            if phone.isEmpty {
                let errorMessage = "手机号为空，请输入注册的手机号"
                displayMessage(errorMessage)
            } else {
                let errorMessage = "该手机号未注册"
                displayMessage(errorMessage)
            }
            
        }
    }
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func displayMessage(theMessage: String) {
     
        let myAlert = UIAlertController(title:"提示", message: theMessage, preferredStyle: UIAlertControllerStyle.Alert)
      
        let OKaction = UIAlertAction(
            title: "知道了",
            style: .Default) { action in self.dismissViewControllerAnimated(true, completion: nil)
            }
      
        myAlert.addAction(OKaction)
        
       presentViewController(myAlert, animated: true, completion: nil)
        
            
        
       
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

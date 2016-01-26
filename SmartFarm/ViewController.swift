//
//  ViewController.swift
//  SmartFarm
//
//  Created by Yuan Yinhuan on 15/8/25.
//  Copyright (c) 2015年 Jun Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var userPhone: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if (userPhone != nil && userPassword != nil) {
            
        self.userPhone.delegate = self
        self.userPassword.delegate = self
         
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }

    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        let phone = userPhone.text
        let password = userPassword.text
        
        let userPhoneStored = NSUserDefaults.standardUserDefaults().stringForKey("phoneNumber")
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("password")
        if (userPhoneStored == phone) {
            if(userPasswordStored == password) {
                //login is successful
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIN")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.dismissViewControllerAnimated(true, completion: nil)
                
                self.performSegueWithIdentifier("login", sender: self)
            } else {
                
                let userMessage = "密码错误，请重新输入"
                let myAlert = UIAlertController(title: "提示", message: userMessage, preferredStyle: .Alert)
                let action = UIAlertAction(
                    title: "知道了",
                    style: .Default) { action in self.dismissViewControllerAnimated(true, completion: nil)
                }
                myAlert.addAction(action)
                presentViewController(myAlert, animated: true, completion: nil)
            }
            
        } else {
            let userMessage = "手机号不存在，请重新输入"
            let myAlert = UIAlertController(title: "提示", message: userMessage, preferredStyle: .Alert)
            let action = UIAlertAction(
                title: "知道了",
                style: .Default) { action in self.dismissViewControllerAnimated(true, completion: nil)
            }
            myAlert.addAction(action)
            presentViewController(myAlert, animated: true, completion: nil)
        
         }
        
        }
   /*
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("love")
        
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        println("you")
        if (!isUserLoggedIn) {
            
            self.performSegueWithIdentifier("login", sender: self)
            
            println("\(isUserLoggedIn)")
            
        }
        
        println("foreever")
    }
    */
}

    
    
    



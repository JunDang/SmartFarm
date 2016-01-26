//
//  registerViewController.swift
//  SmartFarm
//
//  Created by Yuan Yinhuan on 15/8/25.
//  Copyright (c) 2015年 Jun Dang. All rights reserved.
//

import UIKit

class registerViewController: UIViewController, UITextFieldDelegate {

        
        
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userAddress: UITextField!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        if userPhone != nil && userPassword != nil && userAddress != nil {
            self.userPhone.delegate = self
            self.userPassword.delegate = self
            self.userAddress.delegate = self
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
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
            
        let phoneNumber = userPhone.text
        let password = userPassword.text
        let address = userAddress.text
            
            //check for empty fileds
        if (phoneNumber!.isEmpty || password!.isEmpty || address!.isEmpty) {
                //Dispaly alert message with confirmation
            displayAlertMessage("选项不能为空")
                
            } else {
                activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
                activityIndicator.center = self.view.center
                activityIndicator.hidesWhenStopped = true
                activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
                view.addSubview(activityIndicator)
                activityIndicator.startAnimating()
                UIApplication.sharedApplication().beginIgnoringInteractionEvents()
                
                if validate(phoneNumber!) {
                    let userMessage = "不是有效的手机号，请重新输入"
                    var myAlert = UIAlertController(title: "提示", message: userMessage, preferredStyle: .Alert)
                    let action = UIAlertAction(
                        title: "知道了",
                        style: .Default) { action in self.dismissViewControllerAnimated(true, completion: nil)
                    }
                    myAlert.addAction(action)
                    presentViewController(myAlert, animated: true, completion: nil)
                }
                
                
            }
            
            //Store data
            NSUserDefaults.standardUserDefaults().setObject(phoneNumber, forKey: "phoneNumber")
            NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
            NSUserDefaults.standardUserDefaults().setObject(address, forKey: "address")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.activityIndicator.stopAnimating()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            //Dispaly alert message with confirmation
            let userMessage = "注册成功"
            var myAlert = UIAlertController(title: "提示", message: userMessage, preferredStyle: .Alert)
            let action = UIAlertAction(
                title: "知道了",
                style: .Default) { action in self.dismissViewControllerAnimated(true, completion: nil)
            }
            myAlert.addAction(action)
            presentViewController(myAlert, animated: true, completion: nil)
        }
        
        func displayAlertMessage(userMessage: String) {
            
            let myAlert = UIAlertController(title: "提示", message: userMessage, preferredStyle: .Alert)
            let action = UIAlertAction(
                title: "知道了",
                style: .Default,
                handler: nil)
            myAlert.addAction(action)
            presentViewController(myAlert, animated: true, completion: nil)
        }
        
        func validate(value: String) -> Bool {
            // let PHONE_REGEX =
            if let match = value.rangeOfString("^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$", options: .RegularExpressionSearch) {
                print("\(value) is probably polish")
                return false
            }
            print("\(value) is not probably polish")
            return true
    
  }
}

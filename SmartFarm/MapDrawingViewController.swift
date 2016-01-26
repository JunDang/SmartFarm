//
//  MapDrawingViewController.swift
//  SmartFarm
//
//  Created by Yuan Yinhuan on 15/9/2.
//  Copyright (c) 2015年 Jun Dang. All rights reserved.
//

import UIKit
import CoreLocation

class MapDrawingViewController: UIViewController, UISearchBarDelegate {
    
    var searchController: UISearchController!
    
    @IBOutlet weak var address: UITextField!
   
    var error: NSError!

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.prefersStatusBarHidden()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    @IBAction func showSearchBar(sender: AnyObject) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        presentViewController(searchController, animated: true, completion: nil)
         
    }
    
    @IBAction func go(sender: AnyObject) {
        
        let url = NSURL(string: "http://api.map.baidu.com/geocoder/v2/?address=" + address.text + "&output=json&ak=dg6vqwlXGRKITgjxC6c2iQ08")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, respons, error) -> Void in
            var urlError = false
            if error == nil {
                var urlContent = NSString(data:data, encoding: NSUTF8StringEncoding) as? NSString!
                print(urlContent)
            }
        })
        task.resume()
  
        
    }
    /*
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
        
        let searchAddress = self.searchController.searchBar.text
        let url = NSURL(string: "http://api.map.baidu.com/geocoder/v2/?address=\(searchAddress)&output=json&ak=dg6vqwlXGRKITgjxC6c2iQ08")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, respons, error) -> Void in
             var urlError = false
            if error == nil {
                var urlContent = NSString(data:data, encoding: NSUTF8StringEncoding) as? NSString!
                println(urlContent)
            }
        })
        task.resume()
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

//
//  AddFarmViewController.swift
//  SmartFarm
//
//  Created by Yuan Yinhuan on 15/8/27.
//  Copyright (c) 2015年 Jun Dang. All rights reserved.
//

import UIKit
import CoreLocation
import AddressBookUI
import MapKit


class AddFarmViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var farmName: UITextField!
    var name: String = ""
    
 
    
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var zip: UITextField!
    
    var corrds: CLLocationCoordinate2D?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.farmName.delegate = self
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
   
    
    @IBAction func connectMap(sender: AnyObject) {
        print("1")
        let geoCoder = CLGeocoder()
        let address = "\(city.text) \(country.text) \(zip.text)"
        print(address)
        
        geoCoder.geocodeAddressString(address, completionHandler: { (placemarks: [AnyObject]!, error: NSError!) in
            if error != nil {
                print("Geocode failed with error: \(error.localizedDescription)")
            } else if placemarks.count > 0 {
                let placemark = placemarks[0] as! CLPlacemark
                let location = placemark.location
                self.corrds = location!.coordinate
                
                self.showMap()
            }
        })

       
        
    }
    
    
    
  

    func showMap() {
        print("0")
        let addressDict = [kABPersonAddressCityKey as NSString: city.text, kABPersonAddressCountryKey as NSString: country.text, kABPersonAddressZIPKey as NSString: zip.text]
        
        
        let place = MKPlacemark(coordinate: corrds!, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: place)
       // let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMapsWithLaunchOptions(nil)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "doneSegue" {
            name = farmName.text!
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

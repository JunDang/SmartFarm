//
//  FarmListTableViewController.swift
//  SmartFarm
//
//  Created by Yuan Yinhuan on 15/8/27.
//  Copyright (c) 2015年 Jun Dang. All rights reserved.
//

import UIKit

class FarmListTableViewController: UITableViewController{
    
    var farms = [String]()
    var newFarm: String = ""
    var emptyLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if farms.count == 0 {
            self.emptyLabel.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
            self.emptyLabel.text = "该用户名下尚无地块，请添加地块"
            self.emptyLabel.numberOfLines = 0
            self.emptyLabel.textAlignment = NSTextAlignment.Center
            self.emptyLabel.sizeToFit()
            self.emptyLabel.hidden = false
        
            self.tableView.backgroundView = emptyLabel
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
            return 0
            
        } else {
            self.emptyLabel.hidden = true
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            return farms.count
        }
     
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("farmCell", forIndexPath: indexPath) as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "farmCell")
        }
        
        let image = UIImage(named: "star")
        cell!.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell!.imageView?.highlightedImage = highlightedImage
        
        cell!.textLabel!.text = self.farms[indexPath.row]
        cell!.textLabel?.font = UIFont .boldSystemFontOfSize(25)
        return cell!
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        
        
        
    }
    
    @IBAction func save(segue: UIStoryboardSegue) {
        
        let farmDetailVC = segue.sourceViewController as! AddFarmViewController
        newFarm = farmDetailVC.name
        
        
        farms.append(newFarm)
        
        self.tableView.reloadData()
        
    }
    
    
    
  
        /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

 
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            farms.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView,
        titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
            return "删除"
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

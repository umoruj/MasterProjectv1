//
//  iBeaconTableViewController.swift
//  MasterProjectv1
//
//  Created by Umoru Joseph on 12/15/15.
//  Copyright © 2015 Umoru Joseph. All rights reserved.
//

import UIKit
import CoreData

class iBeaconTableViewController: UITableViewController {
    var location = [String]()
    var iBeaconMajorValue = [String]()
    var iBeaconMinorValue = [String]()
    var fetchedBeacon = [Beacon]()
    var placeHolder = Int()
    
    let address1: String = "https://masterprojectv1.herokuapp.com"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBeacons()
        
        var timer2 = NSTimer()
        timer2 = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(iBeaconTableViewController.view1234), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.location.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =
        self.tableView.dequeueReusableCellWithIdentifier(
            "ibeaconTableCell", forIndexPath: indexPath)
            as! iBeaconTableViewCell
        
        let row = indexPath.row
        
        cell.locationLabel.font =
            UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cell.locationLabel.text = self.location[row]
        cell.majorLabel.text = self.iBeaconMajorValue[row]
        cell.minorLabel.text = self.iBeaconMinorValue[row]
        return cell
    }
    
    func getBeacons(){
        RestApiManager.sharedInstance.getBeaconList{json -> Void in
            let numberOfBeacons = json.count as Int
            var p = 0
            for _ in 1...numberOfBeacons{
                let loc = json[p]["location"].string! as String
                let maj = json[p]["Major"].string! as String
                let min = json[p]["Minor"].string! as String
                self.location.append(loc)
                self.iBeaconMajorValue.append(maj)
                self.iBeaconMinorValue.append(min)
                p++
                
                print(loc, maj, min)

            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue,
        sender: AnyObject?) {
            
            if segue.identifier == "ShowAddBeaconsPage" {
                let detailViewController = segue.destinationViewController
                    as! iBeaconInputViewController
                
                
                detailViewController.webSite = self.address1
            }
    }
    
    func view1234() {
        self.tableView.reloadData()
        
    }

}

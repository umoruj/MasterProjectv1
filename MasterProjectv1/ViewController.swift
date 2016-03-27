//
//  ViewController.swift
//  MasterProjectv1
//
//  Created by Umoru Joseph on 11/21/15.
//  Copyright © 2015 Umoru Joseph. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let moc = DataController().managedObjectContext
    
    @IBOutlet weak var locationCounter: UILabel!
    
    var myRoomSquare : UIView?
    var toiletRectangle : UIView?
    var livingRoomRectangle : UIView?
    var kitchenSquare: UIView?
    var balconyRectangle: UIView?
    var locationInTime = String()
    var count = String()
    let testURL = "https://masterprojectv1.herokuapp.com/locationLog/location"
    let userID = "Joseph Umoru"
    
    @IBOutlet weak var proximityLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    let minorValues = [String]()
    var distance1 = Int()
    var distance2 = Int()
    var distance3 = Int()
    var distance4 = Int()
    var distanceLocation1 = String()
    var distanceLocation2 = String()
    var distanceLocation3 = String()
    var distanceLocation4 = String()
    
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Estimotes")
    let locations = [
        8175: "Node1",
        22782: "Node2",
        1064: "Node3",
        39573: "Node4"
    ]
    let mapOfHouse = [
        8175: "MY ROOM",
        22782: "TOILET",
        1064: "LIVING ROOM",
        39573: "KITCHEN"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dimem1 = CGRectMake(450, 290, 150, 90)
        let dimem2 = CGRectMake(450, 435, 150, 90)
        let dimem3 = CGRectMake(450, 580, 150, 90)
        let dimem4 = CGRectMake(50, 290, 300, 415)
        
        myRoomSquare = UIView(frame: dimem1)
        myRoomSquare?.backgroundColor = UIColor.greenColor()
        
        toiletRectangle = UIView(frame: dimem2)
        toiletRectangle?.backgroundColor = UIColor.blueColor()
        
        kitchenSquare = UIView(frame: dimem3)
        kitchenSquare?.backgroundColor = UIColor.purpleColor()
        
        livingRoomRectangle = UIView(frame: dimem4)
        livingRoomRectangle?.backgroundColor = UIColor.orangeColor()
        
        
        self.view.addSubview(myRoomSquare!)
        self.view.addSubview(toiletRectangle!)
        self.view.addSubview(kitchenSquare!)
        self.view.addSubview(livingRoomRectangle!)
        
        
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(region)
        
        //seedBeacon()
        //fetch()
        
        var timer1 = NSTimer()
        timer1 = NSTimer.scheduledTimerWithTimeInterval(60.0, target: self, selector: #selector(ViewController.sendData1234), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown}
        if (knownBeacons.count > 0) {
            findPerson(knownBeacons)
            //self.count = self.locations[(knownBeacons.first?.minor.integerValue)!]!
        }
        
        //counter(self.count)
        
    }
    
    func findPerson(Nodes: [CLBeacon]){
        for loc in Nodes {
            if(self.locations[loc.minor.integerValue] == "Node1"){
                self.distance1 = loc.proximity.rawValue
                switch (distance1)
                {
                case 0...1:
                    self.distanceLocation1 = "very close"
                    
                case 1...2:
                    self.distanceLocation1 = "close"
                    
                case 2...3:
                    self.distanceLocation1 = "far"
                    
                default:
                    self.distanceLocation1 = "out of range"
                }
            }else if(self.locations[loc.minor.integerValue] == "Node2"){
                self.distance2 = loc.proximity.rawValue
                
                switch (distance2)
                {
                case 0...1:
                    self.distanceLocation2 = "very close"
                    
                case 1...2:
                    self.distanceLocation2 = "close"
                    
                case 2...3:
                    self.distanceLocation2 = "far"
                    
                default:
                    self.distanceLocation2 = "out of range"
                }
            }else if(self.locations[loc.minor.integerValue] == "Node3"){
                self.distance3 = loc.proximity.rawValue
                
                switch (distance3)
                {
                case 0...1:
                    self.distanceLocation3 = "very close"
                    
                case 1...2:
                    self.distanceLocation3 = "close"
                    
                case 2...3:
                    self.distanceLocation3 = "far"
                    
                default:
                    self.distanceLocation3 = "out of range"
                }
            }else if(self.locations[loc.minor.integerValue] == "Node4"){
                self.distance4 = loc.proximity.rawValue
                
                switch (distance4)
                {
                case 0...1:
                    self.distanceLocation4 = "very close"
                    
                case 1...2:
                    self.distanceLocation4 = "close"
                    
                case 2...3:
                    self.distanceLocation4 = "far"
                    
                default:
                    self.distanceLocation4 = "out of range"
                }
            }
        }
        getLocationOfIndividual(self.distanceLocation1,distance2: self.distanceLocation2, distance3: self.distanceLocation3, distance4: self.distanceLocation4)
        setBeacon(distance1, distance2: distance2, distance3: distance3,distance4: distance4)
        
        //fetch()
        //let bean = locationTimestamp()
        //print(bean)
    }
    
    func getLocationOfIndividual(distance1: String, distance2: String, distance3: String, distance4: String){
        if (distance1 == "close" || distance1 == "very close"){
            self.locationLabel.text = mapOfHouse[8175]
            self.proximityLabel.text = distance1
            
            myRoomSquare?.backgroundColor = UIColor.grayColor()
            toiletRectangle?.backgroundColor = UIColor.blueColor()
            kitchenSquare?.backgroundColor = UIColor.purpleColor()
            livingRoomRectangle?.backgroundColor = UIColor.orangeColor()
            if(myRoomSquare?.backgroundColor == UIColor.grayColor()){
                self.locationInTime = "MY ROOM"
            }
            //myRoomSquare?.backgroundColor = UIColor.greenColor()
        }else if (distance2 == "close" || distance2 == "very close"){
            self.locationLabel.text = mapOfHouse[22782]
            self.proximityLabel.text = distance2
            
            toiletRectangle?.backgroundColor = UIColor.grayColor()
            kitchenSquare?.backgroundColor = UIColor.purpleColor()
            livingRoomRectangle?.backgroundColor = UIColor.orangeColor()
            myRoomSquare?.backgroundColor = UIColor.greenColor()
            if(toiletRectangle?.backgroundColor == UIColor.grayColor()){
                self.locationInTime = "TOILET"
            }
            //toiletRectangle?.backgroundColor = UIColor.blueColor()
        }else if (distance3 == "close" || distance3 == "very close"){
            self.locationLabel.text = mapOfHouse[1064]
            self.proximityLabel.text = distance3
            
            livingRoomRectangle?.backgroundColor = UIColor.grayColor()
            myRoomSquare?.backgroundColor = UIColor.greenColor()
            toiletRectangle?.backgroundColor = UIColor.blueColor()
            kitchenSquare?.backgroundColor = UIColor.purpleColor()
            if(livingRoomRectangle?.backgroundColor == UIColor.grayColor()){
                self.locationInTime = "LIVING ROOM"
            }
            //livingRoomRectangle?.backgroundColor = UIColor.orangeColor()
        }else if (distance4 == "close" || distance4 == "very close"){
            self.locationLabel.text = mapOfHouse[39573]
            self.proximityLabel.text = distance4
            
            kitchenSquare?.backgroundColor = UIColor.grayColor()
            livingRoomRectangle?.backgroundColor = UIColor.orangeColor()
            myRoomSquare?.backgroundColor = UIColor.greenColor()
            toiletRectangle?.backgroundColor = UIColor.blueColor()
            if(kitchenSquare?.backgroundColor == UIColor.grayColor()){
                self.locationInTime = "KITCHEN"
            }
            //kitchenSquare?.backgroundColor = UIColor.purpleColor()
        }
    }
    
    func fetch() {
        let personFetch = NSFetchRequest(entityName: "Beacon")
        
        do {
            let fetchedPerson = try moc.executeFetchRequest(personFetch) as! [Beacon]
            if(fetchedPerson.count > 0){
            print(fetchedPerson.last!.distance1!, fetchedPerson.last!.distance2!, fetchedPerson.last!.distance3!, fetchedPerson.last!.distance4!)
            }
            
        } catch {
            fatalError("Failed to fetch person: \(error)")
        }
    }
    
    func checkIfDataIsSame()->Bool{
        let personFetch = NSFetchRequest(entityName: "Beacon")
        
        do {
            let fetchedPerson = try moc.executeFetchRequest(personFetch) as! [Beacon]
            
            if ((fetchedPerson.last!.location == self.locationInTime)){
                return true
            }else{
                print(fetchedPerson.last!.location, self.locationInTime)
                return false
            }
            
        } catch {
            fatalError("Failed to fetch person: \(error)")
        }
    }
    
    func setBeacon(distance1: Int, distance2: Int, distance3: Int, distance4: Int){
        if(0 ... 3 ~= distance1) && (0 ... 3 ~= distance2) && (0 ... 3 ~= distance3) && (0 ... 3 ~= distance4){
            let entity = NSEntityDescription.insertNewObjectForEntityForName("Beacon", inManagedObjectContext: moc) as! Beacon
            let timestamp = locationTimestamp()
            
            
            let dataTest = checkIfDataIsSame()
            print (dataTest)
            
            if(dataTest == false){
            entity.setValue(self.locationInTime, forKey: "location")
            entity.setValue(timestamp, forKey: "timestamp")
            entity.setValue(self.distance1, forKey: "distance1")
            entity.setValue(self.distance2, forKey: "distance2")
            entity.setValue(self.distance3, forKey: "distance3")
            entity.setValue(self.distance4, forKey: "distance4")
            
            do {
                try moc.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            }
        }
    }
    
    func sortDataForServer(timeSt: String)->[(String,String,Int,Int,Int,Int)]{
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = "dd/MM/yy h:mm:ss aaa zzz"
        let now = dateformatter.dateFromString(timeSt)
        let timeST1 = now?.dateByAddingTimeInterval(-60.0)
        
        let dateformatter2 = NSDateFormatter()
        dateformatter2.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateformatter2.timeStyle = NSDateFormatterStyle.LongStyle
        
        let now2 = dateformatter2.stringFromDate(timeST1!)
        
        var bData = [(String,String,Int,Int,Int,Int)]()
        let personFetch = NSFetchRequest(entityName: "Beacon")
        
        do {
            let fetchedBeacons = try moc.executeFetchRequest(personFetch) as! [Beacon]
            if(fetchedBeacons.count > 0){
                for beaconData in fetchedBeacons{
                    
                    if (beaconData.timestamp <= timeSt && beaconData.timestamp >= now2){
                        let d1 = Int(beaconData.distance1!)
                        let d2 = Int(beaconData.distance2!)
                        let d3 = Int(beaconData.distance3!)
                        let d4 = Int(beaconData.distance4!)
                        let my_tuple = (beaconData.location!, beaconData.timestamp!, d1, d2, d3, d4)
                        bData.append(my_tuple)
                    }
                }
            }
            return bData
            
        } catch {
            fatalError("Failed to fetch person: \(error)")
        }
    }
    
    func locationTimestamp()-> String {
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .LongStyle)
        return timestamp
    }
    
    func sendData1234(){
        let timeStamp = locationTimestamp()
        print(self.distance1)
        let data = sortDataForServer(timeStamp)
        print(data)
        RestApiManager.sharedInstance.makeHTTPPostRequest(testURL, userID: self.userID, location: self.locationInTime, timestamp: timeStamp, distance1: self.distance1, distance2: self.distance2, distance3: self.distance3, distance4: self.distance4)
    }
}


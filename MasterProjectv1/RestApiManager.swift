//
//  RestApiManager.swift
//  MasterProjectv1
//
//  Created by Umoru Joseph on 1/2/16.
//  Copyright © 2016 Umoru Joseph. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ServiceResponse = (JSON, NSError?) ->Void

class RestApiManager: NSObject {
    static let sharedInstance = RestApiManager()
    
    func getBeaconList(onCompletion: (JSON) -> Void) {
        let route = "https://masterprojectv1.herokuapp.com/users/userlist"
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data!)
            onCompletion(json, error)
        })
        task.resume()
    }
    
    func makeHTTPPostRequest(path: String, userID: String, location: String, timestamp: String, distance1: Int, distance2: Int, distance3: Int, distance4: Int){
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        request.HTTPMethod = "POST"
        
        let postString = "userID=\(userID)&location=\(location)&timestamp=\(timestamp)&distance1=\(distance1)&distance2=\(distance2)&distance3=\(distance3)&distance4=\(distance4)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            // You can print out response object
            // print("response = \(response)")
    }
        task.resume()
}
}
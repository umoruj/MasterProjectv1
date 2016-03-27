 //
//  iBeaconInputViewController.swift
//  MasterProjectv1
//
//  Created by Umoru Joseph on 12/15/15.
//  Copyright © 2015 Umoru Joseph. All rights reserved.
//

import UIKit
import CoreData

class iBeaconInputViewController: UIViewController {
    
    var webSite: String?
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webSite = "https://masterprojectv1.herokuapp.com"
        print(webSite)
        
        
        if let address = webSite {
            let webURL = NSURL(string: address)
            let urlRequest = NSURLRequest(URL: webURL!)
            webView.loadRequest(urlRequest)
        }
        
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

}

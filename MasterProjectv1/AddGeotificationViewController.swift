//
//  AddGeotificationViewController.swift
//  MasterProjectv1
//
//  Created by Umoru Joseph on 4/26/16.
//  Copyright © 2016 Umoru Joseph. All rights reserved.
//

import UIKit
import MapKit

protocol AddGeotificationsViewControllerDelegate {
    func addGeotificationViewController(controller: AddGeotificationViewController, didAddCoordinate coordinate: CLLocationCoordinate2D,
                                        radius: Double, identifier: String, note: String, eventType: EventType)
}

class AddGeotificationViewController: UITableViewController {
    
    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var zoomButton: UIBarButtonItem!
    
    @IBOutlet weak var eventTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var radiusTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    var delegate: AddGeotificationsViewControllerDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItems = [addButton, zoomButton]
        addButton.enabled = false
        
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func textFieldEditingChanged(sender: UITextField) {
        addButton.enabled = !radiusTextField.text!.isEmpty && !noteTextField.text!.isEmpty
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction private func onAdd(sender: AnyObject) {
        let coordinate = mapView.centerCoordinate
        let radius = (radiusTextField.text! as NSString).doubleValue
        let identifier = NSUUID().UUIDString
        let note = noteTextField.text
        let eventType = (eventTypeSegmentedControl.selectedSegmentIndex == 0) ? EventType.OnEntry : EventType.OnExit
        print("Initial start")
        if (delegate != nil){
        delegate!.addGeotificationViewController(self, didAddCoordinate: coordinate, radius: radius, identifier: identifier, note: note!, eventType: eventType)
        }
    }
    
    @IBAction private func onZoomToCurrentLocation(sender: AnyObject) {
        zoomToUserLocationInMapView(mapView)
    }
}


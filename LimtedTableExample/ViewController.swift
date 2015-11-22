//
//  ViewController.swift
//  LimtedTableExample
//
//  Created by Gene De Lisa on 11/22/15.
//  Copyright © 2015 Gene De Lisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let intervalCellIdentifier = "intervalCellIdentifier"
    
    let intervalNames = [
        "Unison",
        "Minor Second",
        "Major Second",
        "Minor Third",
        "Major Third",
        "Perfect Fourth",
        "Tritone",
        "Perfect Fifth",
        "Minor Sixth",
        "Major Sixth",
        "Minor seventh",
        "Major Seventh",
        "Octave",
        "Minor Ninth",
        "Major Ninth",
        "Minor Tenth",
        "Major Tenth",
        "Eleventh",
        "Augmented Eleventh",
        "Minor Thirteenth",
        "Major Thirteenth",
        "Augmented Thirteenth",
    ]
    
    let limit = 3
    
    var numSelectedIntervals = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - UITableViewDataSource

extension ViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intervalNames.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(intervalCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        cell.accessoryType = .None
        cell.textLabel?.text = intervalNames[indexPath.row]
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate

extension ViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if numSelectedIntervals == limit {
            let alertController = UIAlertController(title: "Oops", message:
                "You are limited to \(limit) selections", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in
            }))
            self.presentViewController(alertController, animated: true, completion: nil)

            return nil
        }
        return indexPath
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("selected  \(intervalNames[indexPath.row])")

        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.selected {
                cell.accessoryType = .Checkmark
                numSelectedIntervals++
            }
        }
        
        if let sr = tableView.indexPathsForSelectedRows {
            print("didDeselectRowAtIndexPath selected rows:\(sr)")
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("deselected  \(intervalNames[indexPath.row])")
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
            numSelectedIntervals--
        }
        
        if let sr = tableView.indexPathsForSelectedRows {
            print("didDeselectRowAtIndexPath selected rows:\(sr)")
        }
    }
    
}

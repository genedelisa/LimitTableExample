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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intervalNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: intervalCellIdentifier, for: indexPath) as UITableViewCell
        
        cell.accessoryType = .none
        cell.textLabel?.text = intervalNames[indexPath.row]
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if let sr = tableView.indexPathsForSelectedRows {
            if sr.count == limit {
                let alertController = UIAlertController(title: "Oops", message:
                    "You are limited to \(limit) selections", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                }))
                self.present(alertController, animated: true, completion: nil)
                
                return nil
            }
        }
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected  \(intervalNames[indexPath.row])")

        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.isSelected {
                cell.accessoryType = .checkmark
            }
        }
        
        if let sr = tableView.indexPathsForSelectedRows {
            print("didDeselectRowAtIndexPath selected rows:\(sr)")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        print("deselected  \(intervalNames[indexPath.row])")
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
        
        if let sr = tableView.indexPathsForSelectedRows {
            print("didDeselectRowAtIndexPath selected rows:\(sr)")
        }
    }
    
}

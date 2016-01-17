//
//  SettingsViewController.swift
//  tip-calculator
//
//  Created by Tyler Anthony on 1/17/16.
//  Copyright © 2016 Tyler Anthony-CodePath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var setTipValue: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Store selected tip value to NSUser Defaults
        let defaults = NSUserDefaults.standardUserDefaults().integerForKey("perValue")
        setTipValue.selectedSegmentIndex = defaults

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Setting up default percentage tip value
    @IBAction func setPercentage(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(setTipValue.selectedSegmentIndex, forKey: "perValue")
        defaults.synchronize()
        
    }

}

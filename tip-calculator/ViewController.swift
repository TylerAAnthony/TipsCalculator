//
//  ViewController.swift
//  tip-calculator
//
//  Created by Tyler Anthony on 1/16/16.
//  Copyright © 2016 Tyler Anthony-CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var tipControle: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    // set up correct values before the screen appears to the user
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let selPer = defaults.integerForKey("perValue")
        tipControle.selectedSegmentIndex = selPer
        
        // makes sure info is saved to NS user defaults
        defaults.synchronize()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // text field becomes the first responder
        billField.becomeFirstResponder()
        
        // fading animations for labels
        self.billAmountLabel.alpha = 0
        self.tipAmountLabel.alpha = 0
        UIView.animateWithDuration(3, animations: {
            // This causes first view to fade in and second view to fade out
            self.billAmountLabel.alpha = 1
            self.tipAmountLabel.alpha = 1
        })
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        //Tip Percentages
        var tipPercentages = [0.18,0.2,0.22]
        let tipPercentage = tipPercentages[tipControle.selectedSegmentIndex]
        //Bill Amount
        let billAmount = NSString(string: billField.text!).doubleValue
        //Tip
        let tip = billAmount * tipPercentage
        //Calculating Total
        let total = billAmount + tip
        
        
        //Create object to format numbers
        let numFormat = NSNumberFormatter()
        numFormat.numberStyle = .CurrencyStyle
        
        //Formating Currency
        tipLabel.text = numFormat.stringFromNumber(tip)
        totalLabel.text = numFormat.stringFromNumber(total)
        
        // stored total amount to NS user defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(billField.text, forKey: "totalAmount")
        defaults.synchronize()
    }

    // when user clicks view hide keyboard
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


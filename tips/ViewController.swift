//
//  ViewController.swift
//  tips
//
//  Created by andychen on 12/29/15.
//  Copyright © 2015 andychen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billFiled: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var defaulthold = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        self.view.backgroundColor = UIColor.whiteColor()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        
        var tipPrecentages = [0.18, 0.2, 0.22]
        var tipPrecentage = tipPrecentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string:billFiled.text!).doubleValue
        var tip = billAmount * tipPrecentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipSelect = defaults.integerForKey("default_tip_percentage")
        print(tipSelect)
        defaulthold = tipSelect;
        
        var temp = NSUserDefaults.standardUserDefaults()
        temp.setInteger(defaulthold, forKey: "holdOldValue")
        temp.synchronize()
        
        tipControl.selectedSegmentIndex=tipSelect
        
        
        
        let defaultss = NSUserDefaults.standardUserDefaults()
        let colorSelectIndex = defaultss.integerForKey("backGroundColor")
        print(colorSelectIndex)
        switch(colorSelectIndex){
        case 0:
            self.view.backgroundColor = UIColor.whiteColor()
        case 1:
            self.view.backgroundColor = UIColor.lightGrayColor()
        case 2:
            self.view.backgroundColor = UIColor.yellowColor()
        default:
            self.view.backgroundColor = UIColor.whiteColor()
        }
        
       
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view did disappear")
    }
}


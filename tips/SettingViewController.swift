//
//  SettingViewController.swift
//  tips
//
//  Created by zhizhengchen on 1/25/16.
//  Copyright © 2016 andychen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var ColorPicker: UIPickerView!
    
    @IBOutlet weak var backGroundPick: UISegmentedControl!
    
    @IBOutlet weak var Seg: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Default Setting";
        self.view.backgroundColor = UIColor.whiteColor()
        backGroundPick.selectedSegmentIndex = -1
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSegChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(Seg.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        let input = NSUserDefaults.standardUserDefaults()
        let tipSelect = input.integerForKey("holdOldValue")
        Seg.selectedSegmentIndex = tipSelect
    }
    
    
    @IBAction func onPickBackground(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if backGroundPick.selectedSegmentIndex == -1 {
            defaults.setInteger(-1, forKey: "backGroundColor")
        }
        else{
            defaults.setInteger(backGroundPick.selectedSegmentIndex, forKey: "backGroundColor")
        }
        defaults.synchronize()
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

//
//  SatisfactionViewController.swift
//  TipAdvisor
//
//  Created by Chris Okorodudu on 4/22/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class SatisfactionViewController: UIViewController {
    
    var nextViewController: UIViewController!
    @IBOutlet weak var satisfaction1Button: UIButton!
    @IBOutlet weak var satisfaction2Button: UIButton!
    @IBOutlet weak var satisfaction3Button: UIButton!
    @IBOutlet weak var satisfaction4Button: UIButton!
    @IBOutlet weak var satisfaction5Button: UIButton!
    private var tipValue: Float = 0
    
    
    var buttons = [UIButton]()
    
    func setTipValue(tipAmount: Float) -> Void {
        self.tipValue = tipAmount
        print("TIP VALUE: ", self.tipValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttons.append(satisfaction1Button)
        buttons.append(satisfaction2Button)
        buttons.append(satisfaction3Button)
        buttons.append(satisfaction4Button)
        buttons.append(satisfaction5Button)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func satisfaction1Tapped(_ sender: Any) {
        
        if let button = sender as? UIButton {
            for but in buttons{
                if (but != button){
                    but.backgroundColor = UIColor.clear
                    but.isSelected = false
                }
            }
    
            if button.isSelected {
                button.setImage(UIImage(named: "satisfaction1"), for: UIControlState.normal)
                button.backgroundColor = UIColor.clear
                button.isSelected = false
            } else {
                button.backgroundColor = UIColor(red:0.67, green:0.81, blue:0.93, alpha:1.0)
                button.isSelected = true
            }
        }
    }

    @IBAction func satisfaction2Tapped(_ sender: Any) {
        if let button = sender as? UIButton {
            for but in buttons{
                if (but != button){
                    but.backgroundColor = UIColor.clear
                    but.isSelected = false
                }
            }
            
            if button.isSelected {
                button.setImage(UIImage(named: "satisfaction2"), for: UIControlState.normal)
                button.backgroundColor = UIColor.clear
                button.isSelected = false
            } else {
                button.backgroundColor = UIColor(red:0.67, green:0.81, blue:0.93, alpha:1.0)
                button.isSelected = true
            }
        }
    }
    
    @IBAction func satisfaction3Tapped(_ sender: Any) {
        if let button = sender as? UIButton {
            for but in buttons{
                if (but != button){
                    but.isSelected = false
                    but.backgroundColor = UIColor.clear
                }
            }
            
            
            if button.isSelected {
                button.setImage(UIImage(named: "satisfaction3"), for: UIControlState.normal)
                button.backgroundColor = UIColor.clear
                button.isSelected = false
            } else {
                button.backgroundColor = UIColor(red:0.67, green:0.81, blue:0.93, alpha:1.0)
                button.isSelected = true
            }
        }
    }
    @IBAction func satisfaction4Tapped(_ sender: Any) {
        if let button = sender as? UIButton {
            for but in buttons{
                if (but != button){
                    but.isSelected = false
                    but.backgroundColor = UIColor.clear
                }
            }
            
            if button.isSelected {
                button.setImage(UIImage(named: "satisfaction4"), for: UIControlState.normal)
                button.backgroundColor = UIColor.clear
                button.isSelected = false
            } else {
                button.backgroundColor = UIColor(red:0.67, green:0.81, blue:0.93, alpha:1.0)
                button.isSelected = true
            }
        }
    }
    @IBAction func satisfaction5Tapped(_ sender: Any) {
        if let button = sender as? UIButton {
            for but in buttons{
                if (but != button){
                    but.isSelected = false
                    but.backgroundColor = UIColor.clear
                }
            }
            
            if button.isSelected {
                button.setImage(UIImage(named: "satisfaction5"), for: UIControlState.normal)
                button.backgroundColor = UIColor.clear
                button.isSelected = false
            } else {

                button.backgroundColor = UIColor(red:0.67, green:0.81, blue:0.93, alpha:1.0)
                button.isSelected = true
            }
        }
    }
    
    
    
    
    
     //MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        for i in 0...4 {
            if (buttons[i].isSelected) {
                if (i <= 1) {
                    self.tipValue = self.tipValue + (Float(i) - 1.3)/15
                } else if (i > 2) {
                    self.tipValue = self.tipValue + (Float(i)/35)
                }
                print("TIP VALUE ADJUSTED", self.tipValue)
            }
        }
        
        if (segue.destination.restorationIdentifier == "FinalViewController") {
            if let finalViewController = segue.destination as? FinalViewController {
                finalViewController.setTipValue(tipAmount: self.tipValue)
            }
        }
    }
    

}

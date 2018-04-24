//
//  FinalViewController.swift
//  TipAdvisor
//
//  Created by Chris Okorodudu on 4/23/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userInputAmount: UITextField!
    @IBOutlet weak var totalResult: UILabel!
    private var tipValue: Float = 0
    @IBOutlet weak var finalBill: UILabel!
    @IBAction func textFieldDidChange(_ sender: Any) {
        totalResult.text = String((1.0 * self.tipValue) * NSString(string: self.userInputAmount.text!).floatValue)
        
        finalBill.text = String((1.0 + self.tipValue) * NSString(string: self.userInputAmount.text!).floatValue)
    }
    
    func setTipValue(tipAmount: Float) -> Void {
        self.tipValue = tipAmount
        print("TIP VALUE: ", self.tipValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userInputAmount.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Text Field Delegate
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        totalResult.text = String((1.0 * self.tipValue) * NSString(string: self.userInputAmount.text!).floatValue)
//
//        finalBill.text = String((1.0 + self.tipValue) * NSString(string: self.userInputAmount.text!).floatValue)
//
//
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

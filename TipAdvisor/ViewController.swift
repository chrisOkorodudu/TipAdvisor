//
//  ViewController.swift
//  TipAdvisor
//
//  Created by Chris Okorodudu on 4/20/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var nextViewController: UIViewController!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logoImage.image = #imageLiteral(resourceName: "Logo")
        self.navigationController?.isNavigationBarHidden = true
        
//        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
//        swipeRight.direction = UISwipeGestureRecognizerDirection.right
//        self.view.addGestureRecognizer(swipeRight)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self.navigationController?.viewControllers.count)
        
    }
    
    //MARK: SWIPE GESTURE RECOGNIZER

    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        print("gesture detected")
        if sender.state == .ended {
            if sender.direction == .left {
                if self.nextViewController != nil {
                    self.navigationController?.pushViewController(self.nextViewController, animated: true)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        self.nextViewController = segue.destination
            
//            addEventViewController.newTagArray = newTagArray
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


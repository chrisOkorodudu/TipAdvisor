//
//  SatisfactionViewController.swift
//  TipAdvisor
//
//  Created by Chris Okorodudu on 4/22/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class SatisfactionViewController: UIViewController {
    @IBOutlet weak var satisfaction1Image: UIImageView!
    @IBOutlet weak var satisfaction2Image: UIImageView!
    @IBOutlet weak var satisfaction3Image: UIImageView!
    @IBOutlet weak var satisfaction4Image: UIImageView!
    @IBOutlet weak var satisfaction5Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        satisfaction1Image.image = #imageLiteral(resourceName: "satisfaction1")
        satisfaction2Image.image = #imageLiteral(resourceName: "satisfaction2")
        satisfaction3Image.image = #imageLiteral(resourceName: "satisfaction3")
        satisfaction4Image.image = #imageLiteral(resourceName: "satisfaction4")
        satisfaction5Image.image = #imageLiteral(resourceName: "satisfaction5")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

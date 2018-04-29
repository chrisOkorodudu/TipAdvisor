//
//  BillScannerViewController.swift
//  TipAdvisor
//
//  Created by Chris Okorodudu on 4/28/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import TesseractOCR



class BillScannerViewController: UIViewController, G8TesseractDelegate {

    var billImage: UIImage!
    @IBOutlet weak var recognizedTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.delegate = self
            tesseract.image = billImage.g8_blackAndWhite()
            tesseract.recognize()
            self.recognizedTotal.text = tesseract.recognizedText
            print(tesseract.recognizedText)
        }
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

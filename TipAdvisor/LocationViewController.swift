//
//  LocationViewController.swift
//  TipAdvisor
//
//  Created by Chris Okorodudu on 4/20/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var countryPickerView: UIPickerView!
    private var locationManager: CLLocationManager!
    private var userLocation: CLLocation?
    private var cityString: String = ""
    private var countryString: String = ""
    private var tipLookUp = [String:String]()
    private var countryList = [String]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        rgb(38,84,124)
        self.view.backgroundColor = UIColor(red: 38/255, green: 84/255, blue: 124/255, alpha: 1)
        
        //location manager set up
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.startUpdatingLocation()
        
        //picker setup
        countryPickerView.delegate = self
        self.readFile()
        countryPickerView.reloadAllComponents()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[locations.count-1] as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        mapView.addAnnotation(myAnnotation)
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {(placemarks, error) -> Void in
            print("USER LOCATION: ", userLocation)
            
            if error != nil {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                print("The location is: ",pm.locality!, ",", pm.country!)
                self.cityString = pm.locality!
                self.countryString = pm.country!
            }
            else {
                print("Problem with the data received from geocoder")
            }
        })
        
    }
    
    
    
    //MARK: Country Picker View delegate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return countryList[row]

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("contact")
    }


    

    
    
    //MARK: read country input file, store in dictionary
    func readFile() {
        if let path = Bundle.main.path(forResource: "countries", ofType: "csv") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let countries = data.components(separatedBy: .newlines)
                
                for line in countries {
                    let country = line.split(separator: ",")
                    if (country.count == 2) {
                        let tipCountry = String(country[0])
                        let tip = String(country[1])
                        self.tipLookUp[tipCountry] = tip
                        self.countryList.append(tipCountry)
                    }
                }
                
            } catch {
                print(error)
            }
        }
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

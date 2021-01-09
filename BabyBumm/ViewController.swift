//
//  ViewController.swift
//  BabyBumm
//
//  Created by Burak Altunoluk on 27/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var feedLabel: UILabel!
    
    @IBOutlet weak var medicineLabel: UILabel!
    
    @IBOutlet weak var sleepLabel: UILabel!
    
    let date = Date()
    let formatter = DateFormatter()
    
    var Feed = String()
    var sleep = ""
    var Medicine = ""
    var FC = UserDefaults.standard.object(forKey: "feedCheck")
    var SC = UserDefaults.standard.object(forKey: "sleepCheck")
    var MC = UserDefaults.standard.object(forKey: "medicineCheck")
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "EEEE, d MMM yyyy"
        let result = formatter.string(from: date)
        dateLabel.text = result
        
        let a = UserDefaults.standard.object(forKey: "feed")
        feedLabel.text = a as? String ?? "--"
        let b = UserDefaults.standard.object(forKey: "medicine")
        medicineLabel.text = b as? String ?? "--"
        let c = UserDefaults.standard.object(forKey: "sleep")
        sleepLabel.text = c as? String ?? "--"
        
        if FC as? String == "1" {
            
            feedLabel.backgroundColor = UIColor.systemRed
            feedLabel.textColor = UIColor.white
            UserDefaults.standard.setValue("0", forKey: "feedCheck")
          }
        if SC as? String == "1" {
            
            sleepLabel.backgroundColor = UIColor.systemRed
            sleepLabel.textColor = UIColor.white
            UserDefaults.standard.setValue("0", forKey: "sleepCheck")
          }
           
        if MC as? String == "1" {
            
            medicineLabel.backgroundColor = UIColor.systemRed
            medicineLabel.textColor = UIColor.white
            UserDefaults.standard.setValue("0", forKey: "medicineCheck")
          
            
        }
        
        
        }
    }

 
    




//
//  MedicineViewController.swift
//  BabyBumm
//
//  Created by Burak Altunoluk on 28/12/2020.
//

import UIKit

class MedicineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    var a:Int = 0
    var data = [String]() //Menu icine girilecek data
    var time = ""  // Suanki zaman olarak belirlenecek
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "( HH:mm ) d MMM EEEE "
        let result = formatter.string(from: date)
        time = result
        a = data.count
        if a != 0{
        if result != data[0] {
        data.insert(time, at: 0)
            UserDefaults.standard.setValue("1", forKey: "medicineCheck")
        UserDefaults.standard.setValue(data, forKey: "veri1")
        tableView.reloadData()
            UserDefaults.standard.setValue(data, forKey: "veri1")
            UserDefaults.standard.setValue("Medicine -  \(result)", forKey: "medicine")
            performSegue(withIdentifier: "toMainPage1", sender: nil)
        }
            
        }
        else {data.append(time)
            UserDefaults.standard.setValue(data, forKey: "veri1")
            tableView.reloadData()
            UserDefaults.standard.setValue("1", forKey: "medicineCheck")
                UserDefaults.standard.setValue(data, forKey: "veri1")
            
            UserDefaults.standard.setValue("Medicine -  \(result)", forKey: "medicine")
            
            performSegue(withIdentifier: "toMainPage1", sender: nil)
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Attention", message: "All Activities will be deleted!", preferredStyle: UIAlertController.Style.alert)
        
        let button = UIAlertAction(title: "Ok" , style: UIAlertAction.Style.default) { (UIAlertAction) in
            self.data.removeAll()
            self.data.append("---")
            UserDefaults.standard.setValue(self.data, forKey: "veri1")
            self.tableView.reloadData()
        }
        
        let buttonCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            print("aha")
        }
        alert.addAction(button)
        alert.addAction(buttonCancel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let table = UserDefaults.standard.stringArray(forKey: "veri1")
        data = table ?? [String]()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            data.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
            UserDefaults.standard.setValue(data, forKey: "veri1")
            tableView.reloadData()
        }
        
    }

  

}

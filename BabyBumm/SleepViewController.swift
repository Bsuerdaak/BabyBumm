//
//  SleepViewController.swift
//  BabyBumm
//
//  Created by Burak Altunoluk on 02/01/2021.
//

import UIKit

class SleepViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableData = [String]() // TableView Array Burada birikecek baslarken bos
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableData =  UserDefaults.standard.stringArray(forKey: "sleepData1") ?? [String]()
      
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        //-------------------
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "( HH:mm ) d MMM EEEE "
        let TodayDate = dateFormatter.string(from:date)
        
        //---------------------
        
        
        if tableData.count != 0 {
            if TodayDate != tableData[0] {
            tableData.insert(TodayDate, at:0)
            UserDefaults.standard.setValue("1", forKey: "sleepCheck")
            UserDefaults.standard.setValue(tableData, forKey: "sleepData1")
            tableView.reloadData()
            UserDefaults.standard.setValue(tableData, forKey: "sleepData1")
            UserDefaults.standard.setValue("Sleep -         \(TodayDate)", forKey: "sleep")
            performSegue(withIdentifier: "toMainn", sender: nil)
            }
            
            
        }
        else {
            tableData.append(TodayDate)
            UserDefaults.standard.setValue(tableData, forKey: "sleepData1")
            tableView.reloadData()
            UserDefaults.standard.setValue("1", forKey: "sleepCheck")
            UserDefaults.standard.setValue(tableData, forKey: "sleepData1")
            UserDefaults.standard.setValue("Sleep -         \(TodayDate)", forKey: "sleep")
            performSegue(withIdentifier: "toMainn", sender: nil)
        }
        /*
         tableData.append(TodayDate)
        tableView.reloadData()
        UserDefaults.standard.setValue(tableData, forKey: "sleepData1")
         */
     }
    
    @IBAction func deleteAllButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Attention", message: "All Activities will be deleted", preferredStyle: UIAlertController.Style.alert)
        let alertActionButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            }
        let alertActionCancelButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
            self.tableData.removeAll()
            self.tableData.append("---")
            UserDefaults.standard.setValue(self.tableData, forKey: "sleepData1")
            self.tableView.reloadData()
        }
        alert.addAction(alertActionButton)
        alert.addAction(alertActionCancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableData.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
            UserDefaults.standard.setValue(tableData, forKey: "sleepData1")
            tableView.reloadData()
        }
        
    }
    
    
    
    }
    



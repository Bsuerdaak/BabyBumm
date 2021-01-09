//
//  FeedViewController.swift
//  BabyBumm
//
//  Created by Burak Altunoluk on 27/12/2020.
//

import UIKit

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let date = Date()
    let formatter = DateFormatter()
    
    var a = 0
    var data = ["kayit"]
    var daydate = ""
    
    @IBAction func Delete(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Attention", message: "All Activities will be deleted", preferredStyle: UIAlertController.Style.alert)
        let OkButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("Silindi")
            self.data.removeAll()
            self.data.append("---")
            UserDefaults.standard.setValue(self.data, forKey: "veri")
            self.tableView.reloadData()
        }
        let CancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            print("Silinmedi")
            
            
        }
        alert.addAction(CancelButton)
        alert.addAction(OkButton)
        
       
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func AddButton(_ sender: UIButton) {
       
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "( HH:mm ) d MMM EEEE "
        let result = formatter.string(from: date)
        
        daydate = result
        a = data.count
        if a != 0 {
        if result != data[0]
        {
        data.insert(daydate, at: 0)
        //data.append(daydate)
        UserDefaults.standard.setValue("1", forKey: "feedCheck")
        UserDefaults.standard.setValue(data, forKey: "veri")
        tableView.reloadData()
        UserDefaults.standard.setValue(data, forKey: "veri")
        UserDefaults.standard.set("Feed -          \(result)", forKey: "feed")
        performSegue(withIdentifier: "toMainPage", sender: nil)
        
        }}
        else {
            
            data.append(daydate)
            UserDefaults.standard.setValue(data, forKey: "veri")
            tableView.reloadData()
            UserDefaults.standard.setValue("1", forKey: "feedCheck")
            UserDefaults.standard.setValue(data, forKey: "veri")
            UserDefaults.standard.set("Feed -          \(result)", forKey: "feed")
            performSegue(withIdentifier: "toMainPage", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let table = UserDefaults.standard.stringArray(forKey: "veri")
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            tableView.reloadData()
            UserDefaults.standard.setValue(data, forKey: "veri")
           
        }
    }
 
 
    

}

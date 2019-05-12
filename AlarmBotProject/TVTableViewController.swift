//
//  TVTableViewController.swift
//  Chip- Hotel Booking Chatbot
//
//  Created by Ashna Chandra on 4/7/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class TVTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var counter = 0
    
    var alarms = [Alarm]()
    var alarmo: Alarm?
    let dateFormatter = DateFormatter()
    let locale = NSLocale.current
    
    //let array = ["test","te"]
    
    @IBOutlet weak var myTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Temp.shared.tempArray.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm:ss"

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.myTable.reloadData()
       // print("test")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath as IndexPath)
        
        let cell = UITableViewCell(style: .default , reuseIdentifier: "cell")
        
        
        // Configure the cell...
        let newDate = dateFormatter.string(from: Temp.shared.tempArray[indexPath.row]) //pass Date here

        cell.textLabel?.text = newDate
        
        print("test cell text: \(newDate)")
        
//        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "addTimeSI", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTimeSI" {
            myTable.reloadData()
        }
    }

}

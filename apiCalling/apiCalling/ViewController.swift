//
//  ViewController.swift
//  apiCalling
//
//  Created by Apple User on 19/04/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK: Properties and Outlet
    var factIncoming: String?
    var lenghtIncoming: Any?
    
    private var apiObj: APICall!
   @IBOutlet weak var tableView: UITableView!
    
        //MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiObj = APICall()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = 400
//        tableView.rowHeight = UITableView.automaticDimension
        apiObj.makeAPICall { Bool, sendFact, sendLength in
           self.factIncoming = sendFact
           self.lenghtIncoming = sendLength
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
          
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          
    }
    //MARK: TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.textLabel?.text = self.factIncoming
        print(self.lenghtIncoming!)
        return cell
        
    }
    

}


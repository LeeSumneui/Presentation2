//
//  SearchMainViewController.swift
//  VitaPlanner
//
//  Created by 이수민 on 2018. 5. 27..
//  Copyright © 2018년 이수민. All rights reserved.
//

import UIKit
import CoreData

class SearchMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet var catagoryTable: UITableView!
    @IBOutlet var searchString: UISearchBar!
    
    
    var cataArr:[Int:String] = [0:"모든 영양제 보기", 1:"피로 회복", 2:"소화가 안될 때", 3:"다이어트 할 때", 4:"임산부에게 필요한 영양제"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // table View 정의
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let arr = Array(cataArr.values)
        
        let cell = self.catagoryTable.dequeueReusableCell(withIdentifier: "Catagory Cell", for: indexPath)
       
            cell.textLabel?.text = String(indexPath.row+1) + ". " + String(arr[indexPath.row])

        return cell
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "thrTyping" {
            let destVC = segue.destination as? SearchResultListViewController
            destVC?.searchString = self.searchString.text
        }
    }

}

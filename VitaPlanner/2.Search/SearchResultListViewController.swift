//
//  SearchResultListViewController.swift
//  VitaPlanner
//
//  Created by 이수민 on 2018. 5. 27..
//  Copyright © 2018년 이수민. All rights reserved.
//

import UIKit
import CoreData

class SearchResultListViewController: UIViewController , UITableViewDataSource, UITableViewDelegate  {

    
    @IBOutlet var nutrientTable: UITableView!
    @IBOutlet var resultString: UILabel!
    
    var searchString:String?
    
    // var catagoryIndex:Int?
    var NtrArr:[NSManagedObject] = []
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.nutrientTable.dequeueReusableCell(withIdentifier: "Nutrient Cell", for: indexPath)
        
        let ntr = NtrArr[indexPath.row]
        print("id : \(ntr.value(forKey: "ntrID"))")
        print("name : \(ntr.value(forKey: "ntrName"))")

        if let name = ntr.value(forKey: "ntrName") as? String {
            cell.textLabel?.text = name + String(indexPath.row)
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let a = searchString {
            resultString.text = "\' \(a) \' 에 대한 검색 결과"
        }
        
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"NtrSimple")
        
        do {
            NtrArr = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    
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

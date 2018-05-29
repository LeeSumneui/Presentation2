//
//  ViewController.swift
//  VitaPlanner
//
//  Created by 이수민 on 2018. 5. 14..
//  Copyright © 2018년 이수민. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var NtrID:[String:String] = ["VMULTI":"종합비타민", "VA":"비타민A", "VB":"비타민B", "VD":"비타민D", "VE":"비타민E", "VK":"비타민K", "VC":"비타민C"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    //    let context = getContext()
    //    let entity = NSEntityDescription.entity(forEntityName: "NtrSimple", in: context)
    //    let object = NSManagedObject(entity: entity!, insertInto: context)
        
        let count:Int = NtrID.count
        let ID = Array(NtrID.keys)
        let Name = Array(NtrID.values)
        var i:Int = 0
        

        for _ in 0..<count {
            let context = getContext()
            let entity = NSEntityDescription.entity(forEntityName: "NtrSimple", in: context)
            let object = NSManagedObject(entity: entity!, insertInto: context)
            
            print("** i : \(i)")
            print("id : \(ID[i])")
            print("name : \(Name[i])")
            
            object.setValue(ID[i], forKey: "ntrID")
            object.setValue(Name[i], forKey: "ntrName")
            
            do {
                try context.save()
                print("save!")
            } catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }
            
            i += 1
        }
        
       
        
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}


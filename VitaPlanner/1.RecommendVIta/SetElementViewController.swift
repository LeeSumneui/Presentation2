//
//  SetElementViewController.swift
//  VitaPlanner
//
//  Created by 이수민 on 2018. 5. 27..
//  Copyright © 2018년 이수민. All rights reserved.
//

import UIKit

class SetElementViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var sexSegment: UISegmentedControl!
    @IBOutlet var agePicker: UIPickerView!
    var age:[Int] = [10, 20, 30, 40, 50, 60]
    var selectedFunc:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // picker setting
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return age.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if age[row] == 10 {
            return String(age[row]) + "대 이하"
        } else if age[row] == 60 {
            return String(age[row]) + "대 이상"
        } else {
            return String(age[row]) + "대"
        }
    }
    
    // 기능 선택
    @IBAction func funcButtom(_ sender: UIButton) {
        selectedFunc = sender.titleLabel?.text
    }
    
    // 추천 받기 클릭
    @IBAction func pressGo(_ sender: UIButton) {
        if let content = selectedFunc {
            self.performSegue(withIdentifier: "goToRlt", sender: self)
        } else {
            //error 메세지 : "기능을 선택해주세요"
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

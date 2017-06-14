//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 13/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

class ViewController: UIViewController,EntityProtocol {
    var name : String?
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var binText: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    weak var binLocModel : BinLocModel? = BinLocModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bin View"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIButton) {
        
        self.name =  self.binText.text!
        self.performSegue(withIdentifier: "backToBin", sender: self)
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
        
         (subsequentVC as! NewBinViewController).printName()
        
    }
    
    func setTitle(name : String){
        switch (self.binLocModel?.modelType){
        case BinType : self.binText.text = name
        case  LocationType: self.locationText.text = name
        default : break 
        }
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
         let vc = segue.source as! NewBinViewController
         self.binLocModel?.addElement(name: vc.name)
    }

}

extension ViewController : UIPickerViewDelegate , UIPickerViewDataSource{
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (binLocModel?.names.count)!
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.binLocModel?.names[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.setTitle(name: (self.binLocModel?.names[row])!)
            self.pickerView.isHidden = true
    }
    
}


extension ViewController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        var ret : Bool = true
        
        switch (textField){
        case binText : self.binLocModel?.modelType = .BinType; ret = false
        case locationText : self.binLocModel?.modelType = .LocationType; ret = false
        default : break
        }
        
        return ret
    }
}

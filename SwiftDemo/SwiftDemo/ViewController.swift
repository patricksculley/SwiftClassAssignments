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
     var binLocModel : BinLocModel?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        binLocModel = BinLocModel()
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
        
        
         (subsequentVC as! NewValueViewController).printName()
        
    }
    
    func setTitle(name : String){
        switch ((self.binLocModel)!.modelType){
        case ValueType.BinType : self.binText.text = name
        case  ValueType.LocationType: self.locationText.text = name
        
        }
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
         let vc = segue.source as! NewValueViewController
         self.binLocModel?.addElement(name: vc.name)
    }
    
    @IBAction func changeSegue(sender: UIButton){
        self.pickerView.isHidden = true
        self.binLocModel?.modelType = (sender.tag == 1) ? .BinType : .LocationType
        self.performSegue(withIdentifier:AppConstant.NewValueSegueIdentifier , sender: self)
    
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
        
        case binText : self.binLocModel?.modelType = .BinType;self.binLocModel?.setName(); self.pickerView.isHidden = false; self.pickerView.reloadAllComponents() ;  ret = false ;
        
        case locationText : self.binLocModel?.modelType = .LocationType; self.binLocModel?.setName();self.pickerView.isHidden = false; self.pickerView.reloadAllComponents(); ret = false
        default : break
        }
        
        return ret
    }
}

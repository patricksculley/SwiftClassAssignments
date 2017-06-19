//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 13/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ViewControllerProtocol {
    var name : String?
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var binText: UITextField!
    @IBOutlet weak var itemText: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
     var binLocModel : BinLocModel?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        binLocModel = BinLocModel()
        self.title = "Bin View"
        self.loadMockData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: UIButton) {
        
        if itemText.text?.characters.count != 0{
        let item = Item(itemnName: itemText.text, bin: Bin(binName: binText.text, location: Location(locationName: locationText.text)))
        self.binLocModel?.items.append(item)
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SearchViewController
        vc.items = self.binLocModel?.items
    }
    func loadMockData(){
        
        self.binLocModel?.modelType = .BinType
        self.binLocModel?.addElement(name: "bin 1")
        self.binLocModel?.addElement(name: "bin 2")
        self.binLocModel?.addElement(name: "bin 3")
        
        self.binLocModel?.modelType = .LocationType
        self.binLocModel?.addElement(name: "loc 1")
        self.binLocModel?.addElement(name: "loc 2")
        self.binLocModel?.addElement(name: "loc 3")
        
        self.binLocModel?.items.append(Item(itemnName: "item1", bin: Bin(binName: "bin1", location:Location(locationName: "loc1"))))
        self.binLocModel?.items.append(Item(itemnName: "item2", bin: Bin(binName: "bin2", location:Location(locationName: "loc2"))))
        self.binLocModel?.items.append(Item(itemnName: "item3", bin: Bin(binName: "bin3", location:Location(locationName: "loc3"))))
    
    }
    func setTitle(name : String){
       
        switch ((self.binLocModel)!.modelType){
            case EntityType.BinType : self.binText.text = name
            case  EntityType.LocationType: self.locationText.text = name
            default : break
        }
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        let vc = segue.source as! SearchViewController
        self.itemText.text = vc.selectedItem?.name
        self.binText.text = vc.selectedItem?.bin?.name
        self.locationText.text = vc.selectedItem?.bin?.location?.name
        
        
    }
    
    @IBAction func changeSegue(sender: UIButton){
        self.pickerView.isHidden = true
        self.binLocModel?.modelType = (sender.tag == 1) ? .BinType : .LocationType
        self.showAlertController(entityType: (self.binLocModel?.modelType)!)
    
    }
    @IBAction func searchBtnClick(sender : UIButton){
    
        self.performSegue(withIdentifier:AppConstant.searchViewControllerSegueIdentifier , sender: self)

    }
    
    func showAlertController(entityType : EntityType){
        
        weak var weakSelf = self
    
        let alertController = UIAlertController(title: "\(entityType)", message: "Please Add \(entityType)", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel,handler: { (action) -> Void in
            alertController.dismiss(animated: true, completion: nil)
        })
        
        
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { ( action) -> Void in
            
            if  alertController.textFields?.first?.text?.characters.count == 0 {
               weakSelf?.showErrorAlert(title: "Empty Value", message: "\(entityType) cannot be empty ")
                return;
            }
            else if alertController.textFields?.first?.text?.characters.count != 0{
                weakSelf?.binLocModel?.addElement(name: alertController.textFields?.first?.text!)
                weakSelf?.binLocModel?.setName()
                weakSelf?.setTitle(name: (alertController.textFields?.first?.text)!)
                alertController.dismiss(animated: true, completion: nil)
            }
            
        })
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "\(entityType)"
        }
        
        self.present(alertController, animated: true, completion: nil)
    
        
    
    }
    
    func showErrorAlert (title : String, message : String){
    
         let alert = UIAlertView(title: "", message: message, delegate: nil, cancelButtonTitle: "OK")
        alert.show()
    
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

        if self.binLocModel?.names.count == 0{
            return
        }
        
        self.setTitle(name: (self.binLocModel?.names[row])!)
        self.pickerView.isHidden = true
    }
    
}


extension ViewController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        var ret : Bool = true
        
        switch (textField){
        
        case binText :
            self.binLocModel?.modelType = .BinType;
            self.binLocModel?.setName();
            self.pickerView.isHidden = false;
            self.pickerView.reloadAllComponents() ;
            if (binText.text?.characters.count)! > 0 {
                self.pickerView.selectRow((self.binLocModel?.getIndexOfValue(val: self.binText.text!))!, inComponent: 0, animated: true)
            }
            ret = false ;
            
        
        case locationText :
            self.binLocModel?.modelType = .LocationType;
            self.binLocModel?.setName();
            self.pickerView.isHidden = false;
            self.pickerView.reloadAllComponents();
            if (locationText.text?.characters.count)! > 0 {
                self.pickerView.selectRow((self.binLocModel?.getIndexOfValue(val: self.locationText.text!))!, inComponent: 0, animated: true)
            }

            ret = false
      
        default : break
        }
        
        return ret
    }
    
    
}

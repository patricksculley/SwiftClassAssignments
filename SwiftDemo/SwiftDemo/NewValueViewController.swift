//
//  NewBinViewController.swift
//  SwiftDemo
//
//  Created by Khurram Iqbal on 14/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

class NewValueViewController: UIViewController,EntityProtocol {
    
    var name : String?
    @IBOutlet weak var nameText : UITextField?
    var modelType: ValueType!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender : UIButton){
        self.name = nameText?.text
        self.performSegue(withIdentifier: AppConstant.backToBinControllerSegueIdentifier, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print ("I'm here")
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

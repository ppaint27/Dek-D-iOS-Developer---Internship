//
//  addPage.swift
//  Dek-D Internship
//
//  Created by Parisut Supchokpool on 16/5/2565 BE.
//

import UIKit

protocol addData {
    func addDataDelegate(rawdata:modeldata)
}

class addPage: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDescrip: UITextField!
    
    var delegate:addData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButton(_ sender: Any) {
        var recdata = modeldata(title: tfName.text ?? "test", desc: tfDescrip.text ?? "test")
        delegate?.addDataDelegate(rawdata: recdata)
        dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }

}


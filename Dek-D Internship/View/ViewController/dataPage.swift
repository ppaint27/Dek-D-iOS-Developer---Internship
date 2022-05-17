//
//  dataPage.swift
//  Dek-D Internship
//
//  Created by Parisut Supchokpool on 17/5/2565 BE.
//

import UIKit

class dataPage: UIViewController {

    var showdata:modeldata = modeldata(title: "", desc: "")
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setdata()
    }
    
    func setdata(){
        titleName.text = showdata.title
        desc.text = showdata.desc
        
        titleName.lineBreakMode = .byWordWrapping
        titleName.numberOfLines = 0
        desc.lineBreakMode = .byWordWrapping
        desc.numberOfLines = 0
        
    }
}

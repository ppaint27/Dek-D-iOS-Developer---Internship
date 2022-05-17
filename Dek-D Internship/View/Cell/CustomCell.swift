//
//  CustomCell.swift
//  Dek-D Internship
//
//  Created by Parisut Supchokpool on 16/5/2565 BE.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var headname: UILabel!
    @IBOutlet weak var descrip: UILabel!
    
    func customcell(name:String,des:String) {
        headname.text = name
        descrip.text = des
        
        headname.translatesAutoresizingMaskIntoConstraints = true
        descrip.lineBreakMode = .byWordWrapping
        descrip.numberOfLines = 0
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

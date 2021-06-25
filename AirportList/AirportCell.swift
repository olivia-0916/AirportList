//
//  AirportCell.swift
//  AirportList
//
//  Created by 麥可不可 on 2021/4/18.
//

import UIKit

class AirportCell: UITableViewCell {

    @IBOutlet weak var airportimageview: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var countrylabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

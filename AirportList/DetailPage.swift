//
//  DetailPage.swift
//  AirportList
//
//  Created by 麥可不可 on 2021/4/21.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var photoimage: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var countrylabel: UILabel!
    
    var name:Airport?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoimage.image = UIImage(named: (name?.Image)!)
        countrylabel.text = name?.Country
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



        // Configure the view for the selected state
    }



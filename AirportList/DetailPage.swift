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
    
    @IBOutlet weak var ITATlabel: UILabel!
    
    var airport: Airport?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoimage.image = UIImage(named: (airport?.Image)!)
        countrylabel.text = airport?.Country
        namelabel.text = airport?.Airport
        ITATlabel.text = airport?.IATA
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



        // Configure the view for the selected state
    }



//
//  ViewController.swift
//  AirportList
//
//  Created by LIN on 2021/4/8.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var airports = [Airport]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportCell", for: indexPath) as? AirportCell
        
        let airport = airports[indexPath.row]
        cell?.airportimageview.image = UIImage(named: airport.Image)
        cell?.namelabel.text = airport.Airport
        cell?.countrylabel.text = airport.Country
        return cell!
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let airport = airports[indexPath.row]
    
        performSegue(withIdentifier: "gotodetailpage", sender: airport)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //print(sender as? String)
        switch segue.identifier {
        case "gotodetailpage":
            let airport = sender as? Airport
            if let DetailPage = segue.destination as? DetailPage{
                DetailPage.airport = airport
            }
        default:
            break
        }
//        let controller = segue.destination as? DetailPage
//        if let row = tableView.indexPathForSelectedRow?.row{
//            let controller = segue.destination as? DetailPage
//            controller?.namelabel = airports
//            controller?.countrylabel = airports
//            }
    }
}

    extension ViewController {
    private func fetchData() {
        
        guard let path = Bundle.main.path(forResource: "airports", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let airports = try? PropertyListDecoder().decode([Airport].self, from: xml) else {
            return
            
        }
        self.airports = airports
        tableView.reloadData()
    }
}


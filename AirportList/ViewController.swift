//
//  ViewController.swift
//  AirportList
//
//  Created by LIN on 2021/4/8.
//

import UIKit

class ViewController: UIViewController{
    var airports = [Airport]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AirportCell", for: indexPath) as! AirportCell
        
        let airport = airports[indexPath.row]
        cell.airportimageview.image = UIImage(named: airport.Image)
        cell.namelabel.text = airport.Airport
        cell.countrylabel.text = airport.Country
        return cell
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let row = tableView.indexPathForSelectedRow?.row
//        {
//            let DetailPage = segue.destination as? DetailPage
//            DetailPage?.name
//        }
//    }
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
    
    struct Airport: Decodable {
        var Airport: String
        var Country: String
        var IATA: String
        var Image: String
        var ServedCity: String
        var ShortName: String
    }
}


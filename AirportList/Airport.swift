//
//  Airport.swift
//  AirportList
//
//  Created by 麥可不可 on 2021/4/21.
//

import Foundation

struct Airport: Decodable {
    var Airport: String
    var Country: String
    var IATA: String
    var Image: String
    var ServedCity: String
    var ShortName: String
}

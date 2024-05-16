//
//  Product.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import Foundation
import ObjectMapper

/*
 "name": "Fantastic Frozen Fish",
 "imageUrl": "https://loremflickr.com/640/480",
 "desc": "Boston's most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
 "price": "619.00",
 "type": "normal",
 "id": "2",
 "departmentId": "2"
*/

struct Product: Mappable {
    var id: String = ""
    var name: String = ""
    var imageUrl: String = ""
    var desc: String = ""
    var price: String = ""
    var type: String = ""
    var departmentId: String = ""
    
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        imageUrl <- map["imageUrl"]
        desc <- map["desc"]
        price <- map["price"]
        type <- map["type"]
        departmentId <- map["departmentId"]
        
    }
}

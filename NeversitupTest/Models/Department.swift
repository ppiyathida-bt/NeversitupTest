//
//  Department.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import Foundation
import ObjectMapper

/* 
 "name": "Movies",
 "imageUrl": "https://loremflickr.com/640/480",
 "id": "1"
 */

struct Department: Mappable {

    var id: String = ""
    var name: String = ""
    var imageUrl: String = ""
    
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        imageUrl <- map["imageUrl"]
        
    }
        
}


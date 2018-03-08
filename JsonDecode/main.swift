//
//  main.swift
//  JsonDecode
//
//  Created by Phoenix on 2018/3/8.
//  Copyright © 2018年 Phoenix. All rights reserved.
//

import Foundation

//let jsonString = """
//{"id":44, "band_name":"Gun&Rose"}
//"""

// Fake datas
let aBand: [String: Any] = [
    "id": 23,
    "band_name": "Nirvana"
]

let bands: [[String: Any]] = [
    [
         "id": 23,
         "name": "Nirvana"
    ],
    [
        "id": 22,
        "name": "The Beatles"
    ]
]

let type: [String: Any] = [
    "name": "Rock",
    "examples": [
        [
            "id": 23,
//            "name": "Nirvana"
        ],
        [
            "id": 22,
            "name": "The Beatles",
            "country": "UK"
        ]
    ]
]
// Assume we got a response data from an api
let data = try JSONSerialization.data(withJSONObject: aBand, options: .prettyPrinted)

struct MusicType: Decodable {
    let name: String
    let examples: [Band]
}

struct Band: Decodable {
    let id: Int
    let name: String
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name = "band_name"
    }
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//    }
}

do {
    // Swift 2/3 ObjC
//    guard let dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
//        throw NSError()
//    }
//    let band = Band(json: dict)
    
    let band = try JSONDecoder().decode(Band.self, from: data)
    print(band)
}
catch let error {
    print(error)
}



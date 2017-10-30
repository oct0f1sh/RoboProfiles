//
//  File.swift
//  AppBundleReader
//
//  Created by Duncan MacDonald on 10/27/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation

enum Keys: String, CodingKey {
    case name
    case personality
    case image
    case phrase
}

class Robot: Decodable {
    let name: String
    let personality: String
    let img: String
    let phrase: String
    
    init(name: String, personality: String, img: String, phrase: String) {
        self.name = name
        self.personality = personality
        self.img = img
        self.phrase = phrase
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let name = try container.decode(String.self, forKey: .name)
        let personality = try container.decode(String.self, forKey: .personality)
        let image = try container.decode(String.self, forKey: .image)
        let phrase = try container.decode(String.self, forKey: .phrase)
        
        self.init(name: name, personality: personality, img: image, phrase: phrase)
    }
}

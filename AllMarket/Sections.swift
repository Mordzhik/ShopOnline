//
//  Sections.swift
//  AllMarket
//
//  Created by tse on 10/6/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

struct Sections: Decodable {

  let allCategory: [Section]
  
  enum CodingKeys: String, CodingKey {
    
    case allCategory = "sections"
  }
}

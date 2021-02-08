//
//  Section.swift
//  AllMarket
//
//  Created by tse on 10/4/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit

struct Section: Decodable {
 var id = 1
 var title = "Продукты питания"
 var system_key = "food"
 

}


extension Section: Displayable {
  var titleLabelText: String {
    title
  }
  
 
}


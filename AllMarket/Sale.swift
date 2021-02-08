//
//  Section.swift
//  AllMarket
//
//  Created by tse on 10/4/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit

struct Sale: Decodable {
    var id = 177
    var title = "китикет акция"
    var description = "Купи KITEKAT 2 упаковки и получи третью в подарок"
    var image =  "http://allmarket.armenianbros.com/storage/sales/35232197205f15939be968b8.96071523_2007200652.jpg"
    var started_at = "2020-07-20"
    var finished_at = "2020-12-31"
    /*var type: [String]{
                   "id": 1,
                   "title": "Акция",
                   "system_key": "stock"
               }*/

}


extension Sale: SaleDisplayable {
    var simage: String {
        image
    }
    
    var sdescription: String {
        description
    }
    
    var sstarted_at: String {
        started_at
    }
    
    var sfinished_at: String {
        finished_at
    }
    
  
    
    var titleText: String {
        title
    }
    
    
   
    

 
}

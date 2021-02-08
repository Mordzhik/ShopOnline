//
//  Goods.swift
//  AllMarket
//
//  Created by tse on 10/5/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import Foundation

struct Goods: Decodable  {
  
    let id : Int
    let articul : String
    let barcode : String
    let title : String
    let productDescription : String?
    let brand : String
    let count : Int
    let price : Int
    let priceSale : Int
    let video : String?
    let image : String
    let images: String?
    let rating : Double
    let countViews : Int
   /* let category: [String]
    {
     "id": 32,
     "title": "Средства для стирки",
     "system_key": "stirk"*/
    
    enum CodingKeys: String, CodingKey {
             case id
             case articul
             case barcode
             case title
             case productDescription = "description"
             case brand
             case count
             case price
             case priceSale = "price_sale"
             case video
             case image
             case images
             case rating
             case countViews = "count_views"
           //  case category
    
     }
 }

extension Goods: GoodsDisplayable {
    var goodImage: String {
        image
    }
    
  
    
    var titleLabelText: String {
        title
    }
    
    var priceGood: String {
       String(price)
    }

    
}

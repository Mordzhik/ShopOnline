
import UIKit

struct Popular: Decodable{
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
            /*var category: [String] {
                   "id": 23,
                   "title": "Соки и морсы",
    "system_key": "soki"}*/
    
    
  

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

extension Popular: PopularDisplayable {
    var popularPrice: String { String(priceSale) }
    var priceOld: String { String(price) }
    var titleText: String { title }
    var pimage: String { image }
    
}

  

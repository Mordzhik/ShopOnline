struct GoodsModel: Decodable {

  let allGoods: [Goods]
  
  enum CodingKeys: String, CodingKey {
    
    case allGoods = "products"
  }
}



struct Populars: Decodable {

  let allPopular: [Popular]
  
  enum CodingKeys: String, CodingKey {
    
    case allPopular = "products"
  }
}

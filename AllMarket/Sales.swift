


struct Sales: Decodable {

  let allSales: [Sale]
  
  enum CodingKeys: String, CodingKey {
    
    case allSales = "sales"
  }
}

//
//  HotSaleCollections.swift
//  AllMarket
//
//  Created by tse on 10/13/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit
import Alamofire
import MSPeekCollectionViewDelegateImplementation

class CustomSlider: UISlider {
    @IBInspectable var isInt: Bool = false
}


class HotSaleCollections: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate{
 
    var behavior: MSCollectionViewPeekingBehavior!
    var popularData: [PopularDisplayable] = []
   // var popular: [Popular] = []
    
    override func awakeFromNib() {
    self.delegate = self
    self.dataSource =  self
        reloadDelegate()
        fetchPopular()
        
       
    }
    
    @IBAction func sliderValueDidChange(_ slider: CustomSlider) {
           if slider.isInt {
               let value = slider.value
               slider.value = Float(Int(value))
           }
           
           reloadDelegate()
       }
    func reloadDelegate() {
        reloadData()
       }

   func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return popularData.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotSaleCell", for: indexPath) as! HotSaleCell
   
       let popularItem = popularData[indexPath.row]
           //cell.textLabel?.text = saleItem.titleText
       
        cell.popularTitle?.text = popularItem.titleText
        cell.oldPrice?.text = popularItem.priceOld
        cell.goodsPrice?.text = popularItem.popularPrice
         //  cell.saleImg?.image = UIImage(named: "image_2")
      // let value =  (180 + CGFloat(indexPath.row)*20) / 255
      // cell.contentView.backgroundColor = UIColor(red: value, green: value, blue: value, alpha: 1)
       return cell

    
   }
 

}

extension HotSaleCollections {

  func fetchPopular() {
 
   /*AF.request("http://allmarket.armenianbros.com/api/v2/products/popular?city_id=6").validate().responseDecodable(of: Populars.self) { (response) in
     guard let popular = response.value else { return }
    self.popularData = popular.allPopular
    self.reloadData()
    //self.tableView.reloadData()
    print(popular.allPopular[0].title)
    print (response.value ?? "no value")

   }.authenticate(username: "dev@allmarket.kz", password: "dev")*/
   
    
  
       
           
    let headers : HTTPHeaders  = [ "Accept": "application/json"]
    let requestofAPI =  AF.request("http://allmarket.armenianbros.com/api/v2/products/popular?city_id=6", method: .get,  encoding: URLEncoding.default, headers: headers)
    
        requestofAPI
        .validate()
        .responseDecodable(of: Populars.self) { (response) in
    print(response)
    //to get status code
                    if let status = response.response?.statusCode {
                        switch(status){
                        case 201:
                            print("example success")
                        default:
                            print("error with response status: \(status)")
                        }
                    }
    //to get JSON return value
              switch response.result {
                case let .success(value):
                    print(value)
                case let .failure(error):
                    print(error) }
         guard let sales = response.value else { return }
         self.popularData = sales.allPopular
         self.reloadData()
            
            print(sales.allPopular[0].title)

       }.authenticate(username: "dev@allmarket.kz", password: "dev")
  }
     

}




/*extension HotSaleCollections: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        behavior?.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(behavior?.currentIndex)
    }
}*/



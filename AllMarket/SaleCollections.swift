//
//  SaleCollections.swift
//  AllMarket
//
//  Created by tse on 10/13/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit

class SaleCollections: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    
    
    override func awakeFromNib() {
           self.delegate = self
           self.dataSource =  self
       }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SaleCollectionCell", for: indexPath) as! SaleCollectionCell
        return cell
        
    }
    



}

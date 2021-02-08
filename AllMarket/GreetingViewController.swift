//
//  ViewController.swift
//  AllMarket
//
//  Created by tse on 9/11/20.
//  Copyright © 2020 marzhan. All rights reserved.
//

import UIKit
import MHSoftUI

class GreetingViewController: UIViewController {

    @IBOutlet var regButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.regButton.backgroundColor = UIColor.clear
        self.regButton.layer.cornerRadius = 23.5
        self.regButton.layer.borderWidth = 3
        self.regButton.layer.borderColor = UIColor.white.cgColor
        
    }


}


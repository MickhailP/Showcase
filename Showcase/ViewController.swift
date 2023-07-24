//
//  ViewController.swift
//  Showcase
//
//  Created by dev on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let show1 = FeatureShowcase()
        show1.addTarget(view: button1)
        
    }


}


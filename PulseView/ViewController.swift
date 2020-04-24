//
//  ViewController.swift
//  PulseView
//
//  Created by Jason on 2020/4/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pulseView: PulseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pulseView.layer.contents = #imageLiteral(resourceName: "蓝牙-红").cgImage
        
        pulseView.starAnimation()
        
    }


}


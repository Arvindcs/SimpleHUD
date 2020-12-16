//
//  ViewController.swift
//  SimpleHUD
//
//  Created by arvindcs on 12/16/2020.
//  Copyright (c) 2020 arvindcs. All rights reserved.
//

import UIKit
import SimpleHUD

class ViewController: UIViewController {
    
    private var hud = HUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showActivity(_ sender: UIButton) {
        hud = createdHUD()
        //TODO: - Remove Activity
        //hud.removeFromSuperview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

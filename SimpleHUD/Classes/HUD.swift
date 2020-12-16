//
//  HUD.swift
//  SimpleHUD
//
//  Created by Arvind on 16/03/2020.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

class HUD: UIView {
    
    class
    func hud(_ view: UIView, effect: Bool) -> HUD {
        // TODO:- Transparent Background View
        let hud = HUD(frame: view.bounds)
        view.insertSubview(hud, at: 10)
        hud.isUserInteractionEnabled = true
        hud.isOpaque = false
        hud.backgroundColor = UIColor(white: 0x000000, alpha: 0.1)
        animate(hud: hud, effect: effect)
        
        // TODO:- TimeOut - Automatically remove activity indicator after 30 seconds
        Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { timer in
            timer.invalidate()
            hud.removeFromSuperview()
        }
        return hud
    }
    
    override
    func draw(_ rect: CGRect) {
        let height: CGFloat = 30.0
        let indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(x: (bounds.size.width - height)/2.0,
                                 y: (bounds.size.height - height)/2.0,
                                 width: height,
                                 height: height)
        if #available(iOS 13.0, *) {
            indicator.activityIndicatorViewStyle = .medium
        } else {
            indicator.activityIndicatorViewStyle = .gray
        }
        indicator.startAnimating()
        addSubview(indicator)
    }
    
    class
    func animate(hud: HUD, effect: Bool) {
        if effect == true {
            hud.alpha = 0.0
            UIView.animate(withDuration: 0.33) { hud.alpha = 1.0 }
        }
    }
}

func createdHUD() -> HUD {
    guard let kWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return HUD() }
    let hud = HUD.hud(kWindow, effect: true)
    return hud
}

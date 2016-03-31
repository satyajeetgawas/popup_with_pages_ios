//
//  PropertiesDisplayController.swift
//  GTArboretumTour
//
//  Created by Satyajeet on 3/31/16.
//  Copyright © 2016 CGIS. All rights reserved.
//

import Foundation
import UIKit

class PopupPageController: UIViewController{
    
    
    var itemIndex: Int!
    
    // MARK: - View Lifecycle
     override func viewDidLoad() {
        super.viewDidLoad()
        if itemIndex == 0{
            self.view.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }else if itemIndex == 1{
           self.view.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }else{
            self.view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        }
       
        
    }
    
   
    @IBAction func closePopup(sender: AnyObject) {
        
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.parentViewController!.parentViewController!.view.removeFromSuperview()
                }
        });
        

    }
}
//
//  ViewController.swift
//  PopupPagesDemo
//
//  Created by Satyajeet on 3/30/16.
//  Copyright © 2016 CGIS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var popViewController : PopupViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showPopup(sender: AnyObject) {
        self.popViewController = PopupViewController()
        self.popViewController.title = "This is a popup view"
        self.popViewController.showInView(self.view,animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


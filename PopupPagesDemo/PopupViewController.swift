//
//  PopupViewController.swift
//  PopupPagesDemo
//
//  Created by Satyajeet on 3/30/16.
//  Copyright © 2016 CGIS. All rights reserved.
//

import Foundation
import UIKit

public class PopupViewController : UIViewController,UIPageViewControllerDataSource {
    

    
    //  Variables
    private var pageViewController: UIPageViewController?
    private var parentview: UIView?
   
    
    override public func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        createPageViewController()
        setupPageControl()
    
    }
    
    
    // Create the page view controller
    private func createPageViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pageController = storyboard.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageController.dataSource = self
        let firstController = getItemController(0)!
        let startingViewControllers: NSArray = [firstController]
        pageController.setViewControllers(startingViewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        
        pageViewController = pageController
        self.addChildViewController(pageViewController!)
        let screenRect = UIScreen.mainScreen().bounds
        let screenWidth = screenRect.size.width;
        let screenHeight = screenRect.size.height;
        
        pageViewController?.view.frame = CGRectMake(15, 40 , screenWidth-30 , screenHeight-80)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    
    // Set up the page control indicator at bottom
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
        
    }

    
    // Brings out the popup
    public func showInView(aView: UIView!, animated: Bool)
    {
        parentview = aView
        aView.addSubview(self.view)
        if animated
        {
            self.showAnimate()
        }
    }
    
    
    
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
    }
    
    
    private func getItemController(itemIndex: Int) -> UIViewController? {
        
        if itemIndex < 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
                let pageItemController = storyboard.instantiateViewControllerWithIdentifier("Page") as! PopupPageController
                pageItemController.itemIndex = itemIndex
                return pageItemController
                
            }
            
        
        
        return nil
    }
    
    //  UIPageViewControllerDataSource
    
    public func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if let itemController = viewController as? PopupPageController{
            if itemController.itemIndex > 0 {
                return getItemController(itemController.itemIndex-1)
            }
        }
        return nil
    }
    
    public func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        
        if let itemController = viewController as? PopupPageController{
            if itemController.itemIndex+1 < 3 {
                return getItemController(itemController.itemIndex+1)
            }
        }
                return nil
    }
    
    
    // Page Indicator
    
    public func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    public func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
}
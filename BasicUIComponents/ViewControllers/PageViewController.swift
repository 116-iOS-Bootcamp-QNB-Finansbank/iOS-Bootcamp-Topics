//
//  PageViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 18.09.2021.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.dataSource = self
        self.view.addSubview(pageControl)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let button1VC = storyboard.instantiateViewController(identifier: "ButtonViewController")
        button1VC.view.tag = 0
        let button2VC = storyboard.instantiateViewController(identifier: "ButtonViewController")
        button2VC.view.tag = 1
        let button3VC = storyboard.instantiateViewController(identifier: "ButtonViewController")
        button3VC.view.tag = 2
//        let navigationVC = storyboard.instantiateViewController(identifier: "NavigationExampleViewController")
//        let calculatorVC = storyboard.instantiateViewController(identifier: "CalculatorViewController")
        
        myViewControllers = [button1VC, button2VC, button3VC]
       self.setViewControllers([button1VC], direction: .forward, animated: true, completion: nil)
    }
    
    private var currentIndex = 0
    
    private var myViewControllers: [UIViewController] = []
    
    private var pageControl: UIPageControl {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let pageControl = UIPageControl(frame: CGRect(x: screenWidth / 2, y: screenHeight - 100, width: 100, height: 100))
        
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.backgroundColor = .red
        pageControl.pageIndicatorTintColor = .yellow
        return pageControl
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = viewController.view.tag
        print(index)
        if index == 0 {
            return nil
        } else {
            return myViewControllers[index - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = viewController.view.tag
        print(index)
        if index + 1 < myViewControllers.count {
            return myViewControllers[index + 1]
        } else {
            return nil
        }
    }
}
